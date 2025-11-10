import 'package:discord_server/src/generated/protocol.dart';
import 'package:discord_server/src/utils/app_logger.dart';
import 'package:discord_server/src/utils/auth_helper.dart';
import 'package:discord_server/src/utils/rate_limiter.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class MessageEndpoint extends Endpoint {
  /// Require authentication for all message operations
  @override
  bool get requireLogin => true;
  /// Fetch paginated messages
  /// [cursor] used to fetch data based on the id of the message we want to fetch the messages before (since the chat is reversed)
  Future<List<Message>> fetchChatsPaginated(
      Session session, int channelId, int cursor) async {
    AppLogger.endpoint('MessageEndpoint', 'fetchChatsPaginated', 
      params: {'channelId': channelId, 'cursor': cursor});
    
    return await session.db.transaction((transaction) async {
      final messages = await Message.db.find(
        session,
        where: (message) =>
            message.channelId.equals(channelId) & (message.id < (cursor)),
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
        orderBy: (message) => message.timeStamp,
        limit: 15,
        orderDescending: true,
      );

      return messages;
    });
  }

  // Method to send a message
  Future<Message> sendMessage(Session session, Message message) async {
    AppLogger.endpoint('MessageEndpoint', 'sendMessage', 
      params: {'channelId': message.channelId, 'senderId': message.senderInfoId});
    
    // Validate authenticated user is the sender
    final authenticatedUserId = await AuthHelper.requireAuthentication(session);
    
    // Apply rate limiting per user
    final rateLimitKey = 'message_send_$authenticatedUserId';
    if (!RateLimiters.messages.isAllowed(rateLimitKey)) {
      final remaining = RateLimiters.messages.getRemainingRequests(rateLimitKey);
      AppLogger.warning('Rate limit exceeded for user $authenticatedUserId');
      throw RateLimitExceededException(
        message: 'Too many messages sent. Please slow down.',
        retryAfterSeconds: 10,
      );
    }
    
    return await session.db.transaction((transaction) async {
      try {
        if (message.senderInfoId != authenticatedUserId) {
          AppLogger.warning('Unauthorized message send attempt', 
            null, 
            StackTrace.current);
          throw ForbiddenException('Cannot send message as another user');
        }

        // Save senderInfo to message object
        final senderId = message.senderInfoId;
        final senderInfo = await DiscordUser.db.findById(
          session,
          senderId,
          include: DiscordUser.include(
            userInfo: UserInfo.include(),
          ),
        );

        AppLogger.database('insert', 'message');
        
        // Save message to database
        final createdMessage = await Message.db.insertRow(
          session,
          message.copyWith(
            senderInfo: senderInfo?.userInfo,
          ),
        );

        AppLogger.websocket('broadcast message', 
          channelId: createdMessage.channelId.toString(), 
          userId: senderId);

        // Broadcast message to all connected clients of this channelId
        final updatedMessage = createdMessage.copyWith(isDelivered: true);
        final success = await session.messages
            .postMessage(updatedMessage.channelId.toString(), updatedMessage);
        
        if (success) {
          AppLogger.info('Message sent successfully', messageId: createdMessage.id);
          return await Message.db.updateRow(session, updatedMessage);
        } else {
          AppLogger.error('Failed to broadcast message', createdMessage.id);
          throw MessageNotSentException(
            message: 'Message not sent',
            status: 500,
          );
        }
      } catch (e, stackTrace) {
        AppLogger.error('Error sending message', e, stackTrace);
        rethrow;
      }
    });
  }

  Stream<Message> listenToMessages(Session session, int channelId) async* {
    AppLogger.websocket('Client connected to message stream', channelId: channelId.toString());
    
    final messages =
        session.messages.createStream<Message>(channelId.toString());

    await for (var message in messages) {
      AppLogger.debug('Message received on stream', channelId: channelId);
      yield message;
    }
    
    AppLogger.websocket('Client disconnected from message stream', channelId: channelId.toString());
  }

  Future<Message> deleteMessage(Session session, int messageId) async {
    AppLogger.endpoint('MessageEndpoint', 'deleteMessage', params: {'messageId': messageId});
    
    return await session.db.transaction((transaction) async {
      final message = await Message.db.findById(
        session,
        messageId,
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
      );

      if (message == null) {
        throw NotFoundException(
          message: 'Message not found',
          status: 404,
        );
      }

      // Validate ownership
      await AuthHelper.requireOwnership(
        session,
        message.senderInfoId,
        message: 'You can only delete your own messages',
      );

      await Message.db.updateRow(session, message.copyWith(isDeleted: true));

      final updatedMessage = await Message.db.findById(
        session,
        messageId,
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
      );

      if (updatedMessage == null) {
        throw NotFoundException(
          message: 'Message not found',
          status: 404,
        );
      }

      return updatedMessage;
    });
  }

  Future<Message> editMessage(
      Session session, int messageId, String content) async {
    return await session.db.transaction((transaction) async {
      final message = await Message.db.findById(
        session,
        messageId,
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
      );

      if (message == null) {
        throw NotFoundException(
          message: 'Message not found',
          status: 404,
        );
      }

      // Validate ownership
      await AuthHelper.requireOwnership(
        session,
        message.senderInfoId,
        message: 'You can only edit your own messages',
      );

      await Message.db.updateRow(
        session,
        message.copyWith(content: content),
      );

      final updatedMessage = await Message.db.findById(
        session,
        messageId,
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
      );

      if (updatedMessage == null) {
        throw NotFoundException(
          message: 'Message not found',
          status: 404,
        );
      }
      return updatedMessage;
    });
  }
}
