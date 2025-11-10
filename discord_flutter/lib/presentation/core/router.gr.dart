// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:discord_flutter/presentation/auth/login/login.dart' as _i4;
import 'package:discord_flutter/presentation/core/widgets/loading.dart' as _i3;
import 'package:discord_flutter/presentation/home/home.dart' as _i2;
import 'package:discord_flutter/presentation/home/server/channel/channel.dart'
    as _i1;
import 'package:discord_flutter/presentation/home/server/more_servers/more_servers.dart'
    as _i5;
import 'package:discord_flutter/presentation/home/server/server.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.Channel]
class Channel extends _i7.PageRouteInfo<ChannelArgs> {
  Channel({
    _i8.Key? key,
    required String serverId,
    required String channelId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         Channel.name,
         args: ChannelArgs(key: key, serverId: serverId, channelId: channelId),
         rawPathParams: {'serverId': serverId, 'channelId': channelId},
         initialChildren: children,
       );

  static const String name = 'Channel';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChannelArgs>(
        orElse:
            () => ChannelArgs(
              serverId: pathParams.getString('serverId'),
              channelId: pathParams.getString('channelId'),
            ),
      );
      return _i1.Channel(
        key: args.key,
        serverId: args.serverId,
        channelId: args.channelId,
      );
    },
  );
}

class ChannelArgs {
  const ChannelArgs({
    this.key,
    required this.serverId,
    required this.channelId,
  });

  final _i8.Key? key;

  final String serverId;

  final String channelId;

  @override
  String toString() {
    return 'ChannelArgs{key: $key, serverId: $serverId, channelId: $channelId}';
  }
}

/// generated route for
/// [_i2.Home]
class Home extends _i7.PageRouteInfo<void> {
  const Home({List<_i7.PageRouteInfo>? children})
    : super(Home.name, initialChildren: children);

  static const String name = 'Home';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.Home();
    },
  );
}

/// generated route for
/// [_i3.Loading]
class Loading extends _i7.PageRouteInfo<void> {
  const Loading({List<_i7.PageRouteInfo>? children})
    : super(Loading.name, initialChildren: children);

  static const String name = 'Loading';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i3.Loading());
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MoreServers]
class MoreServers extends _i7.PageRouteInfo<void> {
  const MoreServers({List<_i7.PageRouteInfo>? children})
    : super(MoreServers.name, initialChildren: children);

  static const String name = 'MoreServers';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.MoreServers();
    },
  );
}

/// generated route for
/// [_i6.Server]
class Server extends _i7.PageRouteInfo<ServerArgs> {
  Server({
    _i8.Key? key,
    required String serverId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         Server.name,
         args: ServerArgs(key: key, serverId: serverId),
         rawPathParams: {'serverId': serverId},
         initialChildren: children,
       );

  static const String name = 'Server';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ServerArgs>(
        orElse: () => ServerArgs(serverId: pathParams.getString('serverId')),
      );
      return _i6.Server(key: args.key, serverId: args.serverId);
    },
  );
}

class ServerArgs {
  const ServerArgs({this.key, required this.serverId});

  final _i8.Key? key;

  final String serverId;

  @override
  String toString() {
    return 'ServerArgs{key: $key, serverId: $serverId}';
  }
}
