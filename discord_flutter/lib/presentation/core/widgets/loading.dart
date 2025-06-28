import 'package:auto_route/auto_route.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/auth/auth_cubit.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/widgets/wumpus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class Loading extends StatelessWidget implements AutoRouteWrapper {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    locator<AuthCubit>().checkAuth();
    final isMobile = MediaQuery.sizeOf(context).width <= 480;

    return Wumpus(
      text: 'Wumpus is loading your data...',
      width: isMobile ? 400 : 600,
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.isLoggedIn) {
              locator<UserCubit>().getUser(state.userId);
              locator<ServerCubit>().fetchServers(state.userId);
            } else {
              context.router.replacePath('/login');
            }
          },
        ),
        BlocListener<ServerCubit, ServerState>(
          listener: (context, state) {
            if (state.servers.isNotEmpty) {
              final firstServerId = state.selectedServer.id;
              final defaultChannelId = state.selectedServer.defaultChannelId;
              locator<ChannelCubit>()
                  .fetchChannelGroups(firstServerId!, defaultChannelId!);
              locator<ChatCubit>().fetchChats(defaultChannelId);
              locator<ChatCubit>().listenToMessages(
                defaultChannelId,
              );
            }
          },
        ),
        BlocListener<ChannelCubit, ChannelState>(listener: (context, state) {
          if (state.groups.isNotEmpty && !state.isLoading) {
            final firstServerId =
                locator<ServerCubit>().state.selectedServer.id;
            final firstChannelId =
                locator<ServerCubit>().state.selectedServer.defaultChannelId;
            final channel = state.groups
                .expand<DiscordChannel>((group) => group.channels)
                .firstWhere((channel) => channel.id == firstChannelId);

            locator<ChannelCubit>().setChannel(channel);
            context.router.replacePath(
                '/home/servers/$firstServerId/channels/$firstChannelId');
          }
        }),
      ],
      child: this,
    );
  }
}
