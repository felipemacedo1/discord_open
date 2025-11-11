import 'package:discord_server/configs.dart';
import 'package:discord_server/src/endpoints/discord_user_endpoint.dart';
import 'package:discord_server/src/utils/auth_helper.dart';
import 'package:livekit_server_sdk/livekit_server_sdk.dart';
import 'package:serverpod/serverpod.dart';

class LiveStreamEndpoint extends Endpoint {
  /// Require authentication for live stream operations
  @override
  bool get requireLogin => true;

  Future<String> generateToken(
      Session session, String userId, String roomName) async {
    return await session.db.transaction((transaction) async {
      // Validate that user is requesting token for themselves
      final authenticatedUserId = await AuthHelper.requireAuthentication(session);
      final requestedUserId = int.parse(userId);
      
      if (authenticatedUserId != requestedUserId) {
        throw ForbiddenException('Cannot generate token for another user');
      }

      final user = await DiscordUserEndpoint().getUserDetails(
        session,
        requestedUserId,
      );

      final username = user.userInfo?.userName ?? '';

      final accessToken = AccessToken(
        Configs.liveKitApiKey,
        Configs.liveKitApiSecret,
        identity: userId,
        options: AccessTokenOptions(
          identity: userId,
          attributes: {
            'username': username,
            'userImage': user.userInfo?.imageUrl ?? '',
          },
        ),
      );

      accessToken.addGrant(VideoGrant(
        room: roomName,
        roomJoin: true,
        canPublish: true,
        canSubscribe: true,
      ));

      return accessToken.toJwt();
    });
  }
}
