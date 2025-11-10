import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('[AutoRouter] New route pushed: ${route.settings.name}');
    log('[AutoRouter Stack] New route pushed: ${route.data?.router.stack.toList()}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('[AutoRouter] Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log('[AutoRouter] Tab route re-visited: ${route.name}');
  }
}
