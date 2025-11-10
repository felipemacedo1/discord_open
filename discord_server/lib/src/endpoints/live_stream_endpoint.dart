import 'package:discord_server/configs.dart';
import 'package:discord_server/src/endpoints/discord_user_endpoint.dart';
import 'package:livekit_server_sdk/livekit_server_sdk.dart';
import 'package:serverpod/serverpod.dart';

class LiveStreamEndpoint extends Endpoint {
  Future<String> generateToken(
      Session session, String userId, String roomName) async {
    return await session.db.transaction((transaction) async {
      final user = await DiscordUserEndpoint().getUserDetails(
        session,
        int.parse(userId),
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
