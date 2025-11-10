import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/presentation/core/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: Loading.page,
          initial: true,
          path: '/loading',
        ),
        AutoRoute(
          path: '/home',
          page: Home.page,
          children: [
            AutoRoute(
              path: 'servers/all',
              page: MoreServers.page,
            ),
            AutoRoute(
              path: 'servers/:serverId',
              page: Server.page,
              children: [
                AutoRoute(
                  path: 'channels/:channelId',
                  page: Channel.page,
                ),
              ],
            ),
          ],
        ),
      ];
}

class MobileRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: Loading.page,
          initial: true,
          path: '/loading',
        ),
        AutoRoute(
          path: '/servers/all',
          page: MoreServers.page,
        ),
        AutoRoute(
          path: '/home',
          page: Home.page,
          children: [
            AutoRoute(
              path: 'servers/:serverId',
              page: Server.page,
              children: [
                AutoRoute(
                  path: 'channels/:channelId',
                  page: Channel.page,
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: '/chat',
          page: Channel.page,
        ),
      ];
}
