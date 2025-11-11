import 'package:discord_server/src/endpoints/discord_user_endpoint.dart';
import 'package:discord_server/src/generated/protocol.dart';
import 'package:discord_server/src/utils/auth_helper.dart';
import 'package:serverpod/serverpod.dart';

class DiscordServerEndpoint extends Endpoint {
  /// Require authentication for server operations
  @override
  bool get requireLogin => true;
  Future<List<DiscordServer>> getServers(Session session) async {
    return DiscordServer.db.find(session);
  }

  Future<DiscordServerEntity> getServerById(Session session, int id) async {
    return await session.db.transaction((transaction) async {
      final server = await DiscordServer.db.findById(session, id);

      final groups = await Group.db.find(
        session,
        where: (group) => group.discordServerId.equals(server?.id),
      );

      if (server != null) {
        return DiscordServerEntity(server: server, groups: groups);
      } else {
        throw NotFoundException(
          message: 'Server not found',
          status: 404,
        );
      }
    });
  }

  Future<List<DiscordServer>> getAllServers(
    Session session, {
    List<int>? serverIds,
    int? userId,
  }) async {
    return await session.db.transaction((transaction) async {
      if (serverIds != null && serverIds.isNotEmpty) {
        return await _findServerFromIds(session, serverIds);
      }

      if (userId != null) {
        final user = await DiscordUser.db.findById(
          session,
          userId,
          include: DiscordUser.include(
            members: ServerMembership.includeList(),
          ),
        );

        if (user != null) {
          final serverIds = user.members?.map((e) => e.serverId).toList();
          if (serverIds != null && serverIds.isNotEmpty) {
            return await _findServerFromIds(session, serverIds);
          }
        }
      }

      final servers = await DiscordServer.db.find(session);
      return servers;
    });
  }

  Future<DiscordServer?> createDefaultServer(Session session) async {
    return await session.db.transaction((transaction) async {
      // Create server
      final server = DiscordServer(
        name: 'Runtime Snippets',
        newMessagesCount: 1000,
        newMessagesChats: 10,
        serverBackground:
            'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      );
      final createdServer = await DiscordServer.db.insertRow(session, server);

      // Create group
      final group = Group(
        discordServerId: createdServer.id!,
        name: 'Text Channels',
        type: GroupType.text,
      );
      final createdGroup = await Group.db.insertRow(session, group);

      // Create channel
      final channel = DiscordChannel(
        groupId: createdGroup.id!,
        name: 'general',
        icon: 'hash',
        discordServerId: createdServer.id!,
        type: GroupType.text,
      );
      final createdChannel =
          await DiscordChannel.db.insertRow(session, channel);

      // Update server with default channel id
      await DiscordServer.db.updateRow(
          session,
          createdServer.copyWith(
            defaultChannelId: createdChannel.id,
          ));

      // Fetch the complete server with all relations
      return await DiscordServer.db.findById(
        session,
        createdServer.id!,
      );
    });
  }

  Future<List<DiscordServer>> _findServerFromIds(
      Session session, List<int> serverIds) async {
    final servers = <DiscordServer>[];
    for (int i = 0; i < serverIds.length; i++) {
      final serverId = serverIds[i];
      final server = await DiscordServer.db.findById(
        session,
        serverId,
      );
      if (server != null) {
        servers.add(server);
      }
    }
    return servers;
  }

  Future<DiscordServer> createServer(
    Session session, {
    required String serverName,
    required String serverBackground,
    required int creatorId,
  }) async {
    return await session.db.transaction((transaction) async {
      // Create server
      final serverToCreate = DiscordServer(
        name: serverName,
        newMessagesCount: 1000,
        newMessagesChats: 10,
        serverBackground: serverBackground,
      );
      final createdServer =
          await DiscordServer.db.insertRow(session, serverToCreate);

      // Add creator as member
      await DiscordUserEndpoint().addMemberToServer(
        session,
        createdServer.id!,
        creatorId,
      );

      // Create group
      final group = Group(
        discordServerId: createdServer.id!,
        name: 'Text Channels',
        type: GroupType.text,
      );
      final createdGroup = await Group.db.insertRow(session, group);

      // Create channel
      final channel = DiscordChannel(
        groupId: createdGroup.id!,
        name: 'general',
        icon: 'hash',
        discordServerId: createdServer.id!,
        type: GroupType.text,
      );
      final createdChannel =
          await DiscordChannel.db.insertRow(session, channel);

      // Update server with default channel id
      await DiscordServer.db.updateRow(
        session,
        createdServer.copyWith(
          defaultChannelId: createdChannel.id,
        ),
      );

      //Fetch complete server with all relations
      final server = await DiscordServer.db.findById(
        session,
        createdServer.id!,
      );

      if (server == null) {
        throw NotFoundException(
          message: 'Server not found',
          status: 404,
        );
      }

      return server;
    });
  }
}
