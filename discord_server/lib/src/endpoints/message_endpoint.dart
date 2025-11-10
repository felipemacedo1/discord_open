import 'package:discord_server/src/generated/protocol.dart';
import 'package:discord_server/src/utils/auth_helper.dart';
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
    return await session.db.transaction((transaction) async {
      // Validate authenticated user is the sender
      final authenticatedUserId = await AuthHelper.requireAuthentication(session);
      
      if (message.senderInfoId != authenticatedUserId) {
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

      // Save message to database
      final createdMessage = await Message.db.insertRow(
        session,
        message.copyWith(
          senderInfo: senderInfo?.userInfo,
        ),
      );

      // Broadcast message to all connected clients of this channelId
      final updatedMessage = createdMessage.copyWith(isDelivered: true);
      final success = await session.messages
          .postMessage(updatedMessage.channelId.toString(), updatedMessage);
      if (success) {
        return await Message.db.updateRow(session, updatedMessage);
      } else {
        throw MessageNotSentException(
          message: 'Message not sent',
          status: 500,
        );
      }
    });
  }

  Stream<Message> listenToMessages(Session session, int channelId) async* {
    final messages =
        session.messages.createStream<Message>(channelId.toString());

    await for (var message in messages) {
      yield message;
    }
  }

  Future<Message> deleteMessage(Session session, int messageId) async {
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
