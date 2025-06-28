import 'package:discord_flutter/application/auth/auth_cubit.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/live_stream/live_stream_cubit.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/right_side_bar/right_side_bar_cubit.dart';
import 'package:discord_flutter/application/search/search_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/init.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/router.dart';
import 'package:discord_flutter/presentation/core/router_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

void main() async {
  final router =
      Platform.isAndroid || Platform.isIOS ? MobileRouter() : AppRouter();

  //init DI
  initLocator();

  //init dependencies
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<ChatCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<ServerCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<ChannelCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<LiveStreamCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<RightSideBarCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<MemberCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<SearchCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router.config(
          navigatorObservers: () => [RouterObserver()],
        ),
        theme: ThemeData.dark(),
      ),
    ),
  );
}
