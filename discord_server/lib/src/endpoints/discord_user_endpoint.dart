import 'package:discord_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class DiscordUserEndpoint extends Endpoint {
  Future<DiscordUser> getUserDetails(Session session, int userId) async {
    return await session.db.transaction((transaction) async {
      final user = await DiscordUser.db.findById(
        session,
        userId,
        include: DiscordUser.include(
          userInfo: UserInfo.include(),
        ),
      );

      if (user != null) {
        return user;
      } else {
        throw NotFoundException(
          message: 'User not found',
          status: 404,
        );
      }
    });
  }

  Future<void> updateUserStatus(
      Session session, int userId, ActivityStatus status) async {
    await session.db.transaction((transaction) async {
      final user = await DiscordUser.db.findById(session, userId);

      if (user != null) {
        user.status = status;
        await DiscordUser.db.updateRow(session, user);
      } else {
        throw NotFoundException(
          message: 'User not found',
          status: 404,
        );
      }
    });
  }

  Future<List<DiscordUser>> getUsers(Session session, int serverId) async {
    return await session.db.transaction((transaction) async {
      final server = await DiscordServer.db.findById(session, serverId);
      if (server == null) {
        throw NotFoundException(
          message: 'Server not found',
          status: 404,
        );
      }

      // Then get all users who have these memberships
      final users = await DiscordUser.db.find(
        session,
        where: (user) => user.members.any((m) => m.serverId.equals(serverId)),
        include: DiscordUser.include(
          userInfo: UserInfo.include(),
          members: ServerMembership.includeList(),
        ),
      );
      return users;
    });
  }

  Future<void> addMemberToServer(
      Session session, int serverId, int userId) async {
    await session.db.transaction((transaction) async {
      // Check if server exists
      final server = await DiscordServer.db.findById(session, serverId);
      if (server == null) {
        throw NotFoundException(
          message: 'Server not found',
          status: 404,
        );
      }

      // Check if user exists and include their memberships
      final user = await DiscordUser.db.findById(
        session,
        userId,
        include: DiscordUser.include(
          members: ServerMembership.includeList(),
        ),
      );
      if (user == null) {
        throw NotFoundException(
          message: 'User not found',
          status: 404,
        );
      }

      // Check if membership already exists
      final existingMembership = await ServerMembership.db.findFirstRow(
        session,
        where: (membership) =>
            membership.userId.equals(userId) &
            membership.serverId.equals(serverId),
      );

      if (existingMembership != null) {
        return;
      }

      // Create new membership
      final serverMembership = ServerMembership(
        userId: userId,
        serverId: serverId,
        discordUserId: userId,
      );
      final createdMembership =
          await ServerMembership.db.insertRow(session, serverMembership);

      // Update the membership with the _discordUserMembersDiscordUserId field
      final updatedMembership = ServerMembershipImplicit(
        createdMembership,
        $_discordUserMembersDiscordUserId: userId,
      );
      await ServerMembership.db.updateRow(
        session,
        updatedMembership,
        columns: (t) => [t.$_discordUserMembersDiscordUserId],
      );

      // Update user's members list
      final updatedUser = user.copyWith(
        members: [...?user.members, updatedMembership],
      );
      await DiscordUser.db.updateRow(session, updatedUser);
    });
  }
}
