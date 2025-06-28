import 'package:discord_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DiscordGroupEndpoint extends Endpoint {
  Future<List<DiscordGroupEntity>> getAllGroups(
      Session session, int serverId) async {
    return await session.db.transaction((transaction) async {
      final server = await DiscordServer.db.findById(session, serverId);

      final groups = await Group.db.find(
        session,
        where: (group) => group.discordServerId.equals(server?.id),
      );

      final groupEntities = <DiscordGroupEntity>[];
      for (int i = 0; i < groups.length; i++) {
        final channels = await DiscordChannel.db.find(
          session,
          where: (channel) =>
              channel.groupId.equals(groups[i].id) &
              channel.discordServerId.equals(server?.id),
        );

        groupEntities
            .add(DiscordGroupEntity(group: groups[i], channels: channels));
      }
      if (groupEntities.isNotEmpty) {
        return groupEntities;
      } else {
        throw NotFoundException(
          message: 'Channels or Groups not found',
          status: 404,
        );
      }
    });
  }

  Future<DiscordGroupEntity> getGroupById(Session session, int id) async {
    return await session.db.transaction((transaction) async {
      final group = await Group.db.findById(session, id);

      final channels = await DiscordChannel.db.find(
        session,
        where: (channel) => channel.groupId.equals(group?.id),
      );

      if (group != null) {
        return DiscordGroupEntity(group: group, channels: channels);
      } else {
        throw NotFoundException(
          message: 'Channel not found',
          status: 404,
        );
      }
    });
  }
}
