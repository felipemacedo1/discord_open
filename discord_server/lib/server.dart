import 'package:discord_server/src/endpoints/discord_server_endpoint.dart';
import 'package:discord_server/src/endpoints/discord_user_endpoint.dart';
import 'package:discord_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      print('Validation code: $validationCode');
      return true;
    },
    onUserCreated: (session, userInfo) async {
      final userId = userInfo.id;
      if (userId != null) {
        final user = DiscordUser(
          members: [
            ServerMembership(
              serverId: 1,
              userId: userId,
              discordUserId: userId,
            )
          ],
          userInfoId: userId,
          userInfo: userInfo,
          status: ActivityStatus.online,
        );
        await DiscordUser.db.insertRow(session, user);
        await DiscordUserEndpoint().addMemberToServer(
          session,
          1,
          userId,
        );
      }
    },
  ));

  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    // config: Configs.serverpodConfig,
    authenticationHandler: auth.authenticationHandler, //ADD THIS LINE FOR AUTH
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();

  // Create default Discord server on startup
  await _createDefaultDiscordServer(pod);
}

Future<void> _createDefaultDiscordServer(Serverpod pod) async {
  final session = await pod.createSession();

  // Check if a server already exists to avoid duplicates
  final existingServers = await DiscordServerEndpoint().getServers(session);

  if (existingServers.isEmpty) {
    // No servers exist, create the default one
    await DiscordServerEndpoint().createDefaultServer(session);
  }
}
