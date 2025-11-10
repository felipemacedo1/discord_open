import 'package:auto_route/auto_route.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/live_stream/live_stream_cubit.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/search/search_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_server_icon.dart';
import 'package:discord_flutter/presentation/core/components/profile_button.dart';
import 'package:discord_flutter/presentation/core/components/profile_card.dart';
import 'package:discord_flutter/presentation/core/extensions/string_extensions.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:discord_flutter/presentation/core/router.gr.dart';
import 'package:discord_flutter/presentation/home/server/create_server/create_server_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 480;

    return ColoredBox(
      color: ColorPalette.primary,
      child: AnimatedSize(
        curve: Curves.fastOutSlowIn,
        duration: Durations.long4,
        child: BlocBuilder<ServerCubit, ServerState>(
          buildWhen: (previous, current) =>
              previous.isDrawerOpen != current.isDrawerOpen,
          builder: (context, state) {
            final isDrawerOpen = state.isDrawerOpen;

            return SizedBox(
              width: isDrawerOpen ? 350 : 70,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30 + (isMobile ? 16 : 0),
                  bottom: 16 + (isMobile ? 16 : 0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverList.list(
                            children: [
                              StaticServerItem(
                                onPressed: () {
                                  //go to global search
                                },
                                iconPath: Assets.search,
                                isDrawerOpen: isDrawerOpen,
                                leadingText: 'Search',
                              ),
                              StaticServerItem(
                                onPressed: () {
                                  //go to chat
                                },
                                iconPath: Assets.chat,
                                isDrawerOpen: isDrawerOpen,
                                leadingText: 'Messages',
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: ColorPalette.divider,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StaticServerItem(
                                onPressed: () {
                                  final isMobile =
                                      MediaQuery.sizeOf(context).width <= 480;

                                  if (isMobile) {
                                    context.router.push(
                                      MoreServers(),
                                    );
                                  } else {
                                    context.router.navigatePath(
                                      '/home/servers/all',
                                    );
                                  }

                                  //fetch all servers
                                  locator<ServerCubit>().resetSearch();
                                },
                                iconPath: Assets.moreServers,
                                isDrawerOpen: isDrawerOpen,
                                leadingText: 'Servers',
                              ),
                            ],
                          ),
                          BlocBuilder<ServerCubit, ServerState>(
                            builder: (context, state) {
                              return SliverList.builder(
                                itemCount:
                                    state.isLoading ? 10 : state.servers.length,
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: state.isLoading
                                      ? _ServerItemLoading()
                                      : _ServerItem(
                                          server: state.servers[index],
                                          isDrawerOpen: isDrawerOpen,
                                          isSelectedServer:
                                              state.selectedServer.id ==
                                                  state.servers[index].id,
                                        ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    StaticServerItem(
                      onPressed: () {
                        // GO to add server dialog
                        showDialog(
                          context: context,
                          builder: (context) => const CreateServerDialog(),
                        );
                      },
                      iconPath: '',
                      iconSize: 20,
                      isDrawerOpen: isDrawerOpen,
                      leadingText: 'Add Server',
                      iconData: Icons.add,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        if (isDrawerOpen) ...[
                          _LiveStreamWidget(),
                          const SizedBox(height: 8),
                        ],
                        _StaticProfileButton(
                          isDrawerOpen: isDrawerOpen,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ServerItemLoading extends StatelessWidget {
  const _ServerItemLoading();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: ColorPalette.primaryVariantTwo,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ],
    );
  }
}

class _ServerItem extends StatelessWidget {
  const _ServerItem({
    required this.server,
    required this.isDrawerOpen,
    required this.isSelectedServer,
  });

  final DiscordServer server;
  final bool isDrawerOpen;
  final bool isSelectedServer;

  void navigateAndFetchServer(BuildContext context) {
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
    final hasServerBackground = server.serverBackground.trim().isNotEmpty;

    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isDrawerOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if (isDrawerOpen)
              SizedBox(
                width: 16,
              ),
            if (hasServerBackground)
              DiscordServerIcon(
                isSelected: isSelectedServer,
                server: server,
                onTap: () => navigateAndFetchServer(context),
              )
            else
              DiscordIconButton.filled(
                shape: isSelectedServer
                    ? DiscordIconButtonShape.square
                    : DiscordIconButtonShape.circle,
                backgroundColor:
                    isSelectedServer ? ColorPalette.selectedServer : null,
                tooltip: server.name,
                onPressed: () => navigateAndFetchServer(context),
                icon: SvgPicture.asset(
                  Assets.discordLogo,
                  height: 24,
                  width: 24,
                ),
              ),
            if (isDrawerOpen) ...[
              DiscordButton.withLabel(
                onTap: () => navigateAndFetchServer(context),
                label: server.name,
              ),
            ]
          ],
        ),
        Positioned.fill(
          left: 4,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: AnimatedContainer(
                duration: Durations.long3,
                curve: Curves.fastOutSlowIn,
                width: isSelectedServer ? 4 : 0,
                height: isSelectedServer ? 100 : 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StaticServerItem extends StatelessWidget {
  const StaticServerItem({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.isDrawerOpen,
    this.iconSize = 24,
    required this.leadingText,
    this.iconData,
  });

  final void Function() onPressed;
  final String iconPath;
  final bool isDrawerOpen;
  final double iconSize;
  final String leadingText;

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    if (isDrawerOpen) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 16,
          ),
          DiscordIconButton(
            onPressed: onPressed,
            icon: iconPath.isEmpty
                ? Icon(
                    iconData,
                    size: iconSize,
                  )
                : SvgPicture.asset(
                    iconPath,
                    height: iconSize,
                    width: iconSize,
                  ),
          ),
          DiscordButton.withLabel(
            onTap: onPressed,
            label: leadingText,
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DiscordIconButton(
          tooltip: leadingText,
          onPressed: onPressed,
          icon: iconPath.isEmpty
              ? Icon(
                  iconData,
                  size: iconSize,
                )
              : SvgPicture.asset(
                  iconPath,
                  height: iconSize,
                  width: iconSize,
                ),
        ),
      ],
    );
  }
}

class _StaticProfileButton extends StatelessWidget {
  const _StaticProfileButton({
    required this.isDrawerOpen,
  });

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 480;

    return Row(
      mainAxisAlignment:
          isDrawerOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        if (isDrawerOpen)
          SizedBox(
            width: 16,
          ),
        BlocBuilder<UserCubit, UserState>(
          buildWhen: (previous, current) => previous.user != current.user,
          builder: (context, state) {
            return ProfileButton(
              shape: isDrawerOpen
                  ? DiscordIconButtonShape.square
                  : DiscordIconButtonShape.circle,
              imgUrl: state.user.userInfo?.imageUrl,
              status: state.user.status,
              onPressed: () {
                // Open the full menu
                if (isDrawerOpen || isMobile) {
                  showDialog(
                    context: context,
                    builder: (context) => BlocBuilder<UserCubit, UserState>(
                      buildWhen: (previous, current) =>
                          previous.user != current.user,
                      builder: (context, state) => ProfileCard(
                        user: state.user,
                        isCurrentUser: true,
                      ),
                    ),
                  );
                } else {
                  locator<ServerCubit>().toggleDrawer();
                }
              },
            );
          },
        ),
        if (isDrawerOpen)
          Expanded(
            child: SizedBox(
              height: 48,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorPalette.divider,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    BlocBuilder<UserCubit, UserState>(
                      buildWhen: (previous, current) =>
                          previous.user != current.user,
                      builder: (context, state) {
                        return DiscordButton.withChild(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  BlocBuilder<UserCubit, UserState>(
                                buildWhen: (previous, current) =>
                                    previous.user != current.user,
                                builder: (context, state) => ProfileCard(
                                  user: state.user,
                                  isCurrentUser: true,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 90,
                                child: Text(
                                  state.user.userInfo?.userName ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: locator<FontStyles>().usernameStyle,
                                ),
                              ),
                              Text(
                                state.user.status.name.capitalizeFirstLetter(),
                                style: locator<FontStyles>().jumpToPresentStyle,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Spacer(),
                    BlocBuilder<LiveStreamCubit, LiveStreamState>(
                      buildWhen: (previous, current) =>
                          previous.microphoneEnabled !=
                          current.microphoneEnabled,
                      builder: (context, state) {
                        final microphoneEnabled = state.microphoneEnabled;

                        return DiscordIconButton(
                          tooltip: microphoneEnabled
                              ? 'Turn Off Microphone'
                              : 'Turn On Microphone',
                          onPressed: () {
                            //turn the mic on and off
                            locator<LiveStreamCubit>().toggleMicrophone();
                          },
                          icon: Icon(
                            microphoneEnabled ? Icons.mic : Icons.mic_off,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<LiveStreamCubit, LiveStreamState>(
                      buildWhen: (previous, current) =>
                          previous.speakerEnabled != current.speakerEnabled,
                      builder: (context, state) {
                        final speakerEnabled = state.speakerEnabled;

                        return DiscordIconButton(
                          tooltip: speakerEnabled
                              ? 'Turn Off Speaker'
                              : 'Turn On Speaker',
                          onPressed: () {
                            //turn the speaker on and off
                            locator<LiveStreamCubit>().toggleSpeaker();
                          },
                          icon: Icon(
                            speakerEnabled ? Icons.volume_up : Icons.volume_off,
                          ),
                        );
                      },
                    ),
                    DiscordIconButton(
                      tooltip: 'Settings',
                      onPressed: () {
                        //open the settings menu
                      },
                      icon: Icon(
                        Icons.settings,
                      ),
                    ),
                    DiscordIconButton(
                      tooltip: 'Collapse Menu',
                      onPressed: () {
                        //collapse menu
                        locator<ServerCubit>().toggleDrawer();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (isDrawerOpen)
          SizedBox(
            width: 16,
          ),
      ],
    );
  }
}

class _LiveStreamWidget extends StatelessWidget {
  const _LiveStreamWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveStreamCubit, LiveStreamState>(
      buildWhen: (previous, current) =>
          previous.connectedToChannel != current.connectedToChannel ||
          previous.isConnecting != current.isConnecting,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.connectedToChannel || state.isConnecting
              ? Padding(
                  key: const ValueKey('connected'),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorPalette.divider,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.rss_feed,
                                    color: state.isConnecting
                                        ? ColorPalette.error
                                        : ColorPalette.success,
                                  ),
                                  Text(
                                    state.isConnecting
                                        ? 'Connecting...'
                                        : 'Voice Connected',
                                    style: TextStyle(
                                      color: state.isConnecting
                                          ? ColorPalette.error
                                          : ColorPalette.success,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              DiscordIconButton(
                                tooltip: 'Disconnect',
                                onPressed: () {
                                  locator<LiveStreamCubit>().disconnect();
                                },
                                icon: Icon(
                                  Icons.call_end,
                                  color: ColorPalette.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: BlocBuilder<LiveStreamCubit,
                                    LiveStreamState>(
                                  buildWhen: (previous, current) =>
                                      previous.cameraEnabled !=
                                      current.cameraEnabled,
                                  builder: (context, state) {
                                    return DiscordIconButton.filled(
                                      shape: DiscordIconButtonShape.square,
                                      backgroundColor:
                                          ColorPalette.white.withAlpha(20),
                                      tooltip: state.cameraEnabled
                                          ? 'Turn Off Camera'
                                          : 'Turn On Camera',
                                      onPressed: () {
                                        locator<LiveStreamCubit>()
                                            .toggleCamera();
                                      },
                                      icon: Icon(
                                        state.cameraEnabled
                                            ? Icons.videocam
                                            : Icons.videocam_off,
                                        color: ColorPalette.white,
                                        size: 24,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: BlocBuilder<LiveStreamCubit,
                                    LiveStreamState>(
                                  buildWhen: (previous, current) =>
                                      previous.screenShareEnabled !=
                                      current.screenShareEnabled,
                                  builder: (context, state) {
                                    return DiscordIconButton.filled(
                                      backgroundColor:
                                          ColorPalette.white.withAlpha(20),
                                      shape: DiscordIconButtonShape.square,
                                      tooltip: state.screenShareEnabled
                                          ? 'Turn Off Screen Share'
                                          : 'Turn On Screen Share',
                                      onPressed: () {
                                        locator<LiveStreamCubit>()
                                            .toggleScreenShare();
                                      },
                                      icon: Icon(
                                        state.screenShareEnabled
                                            ? Icons.screen_share
                                            : Icons.stop_screen_share,
                                        color: ColorPalette.white,
                                        size: 24,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Divider(color: ColorPalette.divider),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('disconnected')),
        );
      },
    );
  }
}
