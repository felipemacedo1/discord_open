import 'package:discord_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class DiscordChannelEndpoint extends Endpoint {
  Future<DiscordChannelEntity> getChannelById(Session session, int id) async {
    return await session.db.transaction((transaction) async {
      final channel = await DiscordChannel.db.findById(session, id);

      final messages = await Message.db.find(
        session,
        where: (message) => message.channelId.equals(channel?.id),
        include: Message.include(
          senderInfo: UserInfo.include(),
        ),
        orderBy: (message) => message.timeStamp,
        limit: 15,
        orderDescending: true,
      );

      if (channel != null) {
        return DiscordChannelEntity(channel: channel, messages: messages);
      } else {
        throw NotFoundException(
          message: 'Channel not found',
          status: 404,
        );
      }
    });
  }

  Future<DiscordGroupEntity> createChannel(
      Session session, int serverId, String name, GroupType type) async {
    return await session.db.transaction((transaction) async {
      final server = await DiscordServer.db.findById(session, serverId);
      if (server == null) {
        throw NotFoundException(
          message: 'Server not found',
          status: 404,
        );
      }

      final serverGroups = await Group.db.find(
        session,
        where: (group) =>
            group.discordServerId.equals(serverId) & group.type.equals(type),
      );

      Group group;
      if (serverGroups.isEmpty) {
        group = await Group.db.insertRow(
          session,
          Group(
            name: type == GroupType.text ? 'Text Channels' : 'Voice Channels',
            discordServerId: serverId,
            type: type,
          ),
        );
      } else {
        group = serverGroups.first;
      }

      final channel = DiscordChannel(
        discordServerId: serverId,
        name: name,
        type: type,
        groupId: group.id!,
        icon: type == GroupType.text ? 'hash' : 'speaker',
      );

      final updatedChannel =
          await DiscordChannel.db.insertRow(session, channel);

      return DiscordGroupEntity(group: group, channels: [updatedChannel]);
    });
  }
}
