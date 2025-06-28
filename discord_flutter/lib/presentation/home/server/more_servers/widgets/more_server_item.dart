import 'package:auto_route/auto_route.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/search/search_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_server_icon.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MoreServerItem extends StatelessWidget {
  const MoreServerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerCubit, ServerState>(
      buildWhen: (previous, current) =>
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        return ServerList(state: state);
      },
    );
  }
}

class ServerList extends StatelessWidget {
  final ServerState state;

  const ServerList({
    super.key,
    required this.state,
  });

  void navigateAndFetchServer(BuildContext context, DiscordServer server) {
    final serverId = server.id;
    final defaultChannelId = server.defaultChannelId;

    if (serverId == null || defaultChannelId == null) {
      return;
    }

    final currentPath = context.router.currentPath;
    final isCurrentServer = currentPath.contains('/servers/$serverId/');

    if (isCurrentServer) {
      return;
    }

    context.router
        .navigatePath('/home/servers/${server.id}/channels/$defaultChannelId');

    locator<ServerCubit>().setSelectedServer(server);
    locator<ChannelCubit>().fetchChannelGroups(serverId, defaultChannelId);
    locator<MemberCubit>().fetchMembers(serverId: serverId);
    locator<SearchCubit>().resetToInitial();

    locator<ChatCubit>().fetchChats(defaultChannelId);
    locator<ChatCubit>().listenToMessages(
      defaultChannelId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 32,
      children: List.generate(
        state.searchedServers.length,
        (index) {
          final hasServerBackground =
              state.searchedServers[index].serverBackground.isNotEmpty;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: hasServerBackground
                    ? DiscordServerIcon(
                        server: state.searchedServers[index],
                        onTap: () => navigateAndFetchServer(
                          context,
                          state.searchedServers[index],
                        ),
                        isSelected: true,
                        tooltip: '',
                      )
                    : DiscordIconButton.filled(
                        shape: DiscordIconButtonShape.square,
                        backgroundColor: ColorPalette.selectedServer,
                        onPressed: () => navigateAndFetchServer(
                          context,
                          state.searchedServers[index],
                        ),
                        icon: SvgPicture.asset(
                          Assets.discordLogo,
                          height: 24,
                          width: 24,
                        ),
                      ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.searchedServers[index].name,
                    style: locator<FontStyles>().channelHeadingSelected,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: ColorPalette.success,
                        size: 10,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '100K online',
                        style: locator<FontStyles>().channelHeadingUnselected,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.circle,
                        color: ColorPalette.unselectedChannelIcon,
                        size: 10,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '200K members',
                        style: locator<FontStyles>().channelHeadingUnselected,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
