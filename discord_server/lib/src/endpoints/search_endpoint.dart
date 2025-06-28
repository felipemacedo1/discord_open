import 'package:discord_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class SearchEndpoint extends Endpoint {
  Future<List<Message>> searchMessages(
    Session session,
    int channelId,
    String query, {
    int? limit = 20,
    int? offset = 0,
    DateTime? fromDate,
    DateTime? toDate,
    int? senderId,
  }) async {
    return await session.db.transaction((transaction) async {
      WhereExpressionBuilder<MessageTable> whereCondition = (message) =>
          message.channelId.equals(channelId) &
          message.content.ilike('%$query%') &
          message.isDeleted.equals(false);

      // Add date filters if provided
      if (fromDate != null) {
        whereCondition = (message) =>
            whereCondition(message) & (message.timeStamp > fromDate);
      }
      if (toDate != null) {
        whereCondition =
            (message) => whereCondition(message) & (message.timeStamp < toDate);
      }

      // Add sender filter if provided
      if (senderId != null) {
        whereCondition = (message) =>
            whereCondition(message) & message.senderInfoId.equals(senderId);
      }

      final messages = await Message.db.find(
        session,
        where: whereCondition,
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
        orderBy: (message) => message.timeStamp,
        limit: limit,
        offset: offset,
        orderDescending: true,
      );

      return messages;
    });
  }
}
