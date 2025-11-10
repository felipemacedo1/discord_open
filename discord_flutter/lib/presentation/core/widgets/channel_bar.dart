import 'package:auto_route/auto_route.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/live_stream/live_stream_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:discord_flutter/presentation/core/router.gr.dart';
import 'package:discord_flutter/presentation/home/server/create_channel/create_channel_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChannelBar extends StatelessWidget {
  const ChannelBar({
    super.key,
    required this.serverId,
  });

  final String serverId;

  @override
  Widget build(BuildContext context) {
    final serverDetails = locator<ServerCubit>().state.servers.firstWhere(
          (server) => server.id.toString() == serverId,
        );

    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) =>
          previous.isDrawerOpen != current.isDrawerOpen,
      builder: (context, state) => ColoredBox(
        color: ColorPalette.primaryVariantOne,
        child: AnimatedSize(
          curve: Curves.fastOutSlowIn,
          duration: Durations.long4,
          child: SizedBox(
            width: state.isDrawerOpen ? 250 : 0,
            child: CustomScrollView(
              slivers: [
                if (serverDetails.serverBackground.trim().isNotEmpty)
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.network(
                        serverDetails.serverBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 8,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          serverDetails.name,
                          style: locator<FontStyles>().serverHeading,
                        ),
                        Spacer(),
                        DiscordIconButton(
                          onPressed: () {},
                          icon: SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              Assets.options,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: ColorPalette.whiteWithOpacity,
                    ),
                  ),
                ),
                BlocBuilder<ChannelCubit, ChannelState>(
                    builder: (context, state) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverList.builder(
                      itemCount: state.isLoading ? 2 : state.groups.length,
                      itemBuilder: (context, index) {
                        if (state.isLoading) {
                          return _GroupItemLoading();
                        }
                        final discordGroupEntity = state.groups[index];
                        final defaultChannelId = serverDetails.defaultChannelId;

                        return Padding(
                          padding: index != 0
                              ? const EdgeInsets.only(top: 16.0)
                              : EdgeInsets.zero,
                          child: _GroupItem(
                            discordGroupEntity: discordGroupEntity,
                            serverId: serverId,
                            defaultChannelId: defaultChannelId!,
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupItem extends StatefulWidget {
  const _GroupItem({
    required this.discordGroupEntity,
    required this.serverId,
    required this.defaultChannelId,
  });

  final DiscordGroupEntity discordGroupEntity;
  final String serverId;
  final int defaultChannelId;

  @override
  State<_GroupItem> createState() => _GroupItemState();
}

class _GroupItemState extends State<_GroupItem> {
  bool _isExpanded = true;

  void navigateToChannel(
      DiscordChannel channel, bool isSelected, BuildContext context) {
    if (isSelected) return;

    final channelId = channel.id;
    final channelIsText = channel.type == GroupType.text;

    locator<ChannelCubit>().setChannel(channel);

    if (channelIsText) {
      if (channelId != null) {
        locator<ChatCubit>().fetchChats(channelId);
        locator<ChatCubit>().listenToMessages(channelId);
      }
    } else {
      final userId = locator<UserCubit>().state.user.id!;
      final channelId = channel.id!;
      locator<LiveStreamCubit>().joinRoom(userId, channelId);
    }

    final isMobile = MediaQuery.sizeOf(context).width <= 480;

    if (isMobile) {
      context.router.push(Channel(
        serverId: widget.serverId,
        channelId: channelId.toString(),
      ));
    } else {
      context.router
          .replacePath('/home/servers/${widget.serverId}/channels/$channelId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DiscordButton.withChild(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                splashOnly: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: ColorPalette.groupIconColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.discordGroupEntity.group.name.toUpperCase(),
                        style: locator<FontStyles>().groupHeading,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            DiscordIconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CreateChannelDialog(
                    serverId: int.parse(widget.serverId),
                    groupId: widget.discordGroupEntity.group.id!,
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: ColorPalette.groupIconColor,
              ),
            ),
          ],
        ),
        if (_isExpanded)
          ...widget.discordGroupEntity.channels.map(
            (channel) => BlocBuilder<ChannelCubit, ChannelState>(
              buildWhen: (previous, current) =>
                  previous.selectedChannel.id != current.selectedChannel.id,
              builder: (context, state) {
                final isSelected = state.selectedChannel.id == channel.id;
                return Column(
                  children: [
                    DiscordButton.withChild(
                      onTap: () {
                        navigateToChannel(channel, isSelected, context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              channel.icon == 'hash'
                                  ? Assets.hashIcon
                                  : Assets.voiceIcon,
                              height: 16,
                              width: 16,
                              colorFilter: ColorFilter.mode(
                                isSelected
                                    ? ColorPalette.selectedChannelIcon
                                    : ColorPalette.unselectedChannelIcon,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              channel.name,
                              style: isSelected
                                  ? locator<FontStyles>().channelHeadingSelected
                                  : locator<FontStyles>()
                                      .channelHeadingUnselected,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<LiveStreamCubit, LiveStreamState>(
                      buildWhen: (previous, current) =>
                          previous.participants != current.participants,
                      builder: (context, state) {
                        if (state.isConnecting &&
                            state.streamRoom.name == channel.id.toString()) {
                          return Column(
                            children: state.participants.map((participant) {
                              final isMicrophoneEnabled =
                                  participant.isMicrophoneEnabled();
                              final localUserState = locator<UserCubit>().state;
                              final isLocalParticipant = participant.identity ==
                                  localUserState.user.id.toString();

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: DiscordButton.withChild(
                                  onTap: () {},
                                  backgroundColor:
                                      ColorPalette.primaryVariantTwo,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        DiscordIconButton.filled(
                                          onPressed: () {
                                            //go to their profile
                                          },
                                          icon: isLocalParticipant
                                              ? CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    localUserState.user.userInfo
                                                            ?.imageUrl ??
                                                        '',
                                                  ),
                                                )
                                              : SvgPicture.asset(
                                                  Assets.discordLogo,
                                                  fit: BoxFit.scaleDown,
                                                  height: 16,
                                                  width: 16,
                                                ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            participant.identity,
                                            style: locator<FontStyles>()
                                                .channelHeadingUnselected,
                                          ),
                                        ),
                                        Icon(
                                          isMicrophoneEnabled
                                              ? Icons.mic
                                              : Icons.mic_off,
                                          size: 16,
                                          color: isMicrophoneEnabled
                                              ? ColorPalette.success
                                              : ColorPalette.error,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}

class _GroupItemLoading extends StatelessWidget {
  const _GroupItemLoading();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiscordButton.withChild(
          onTap: () {},
          backgroundColor: ColorPalette.primaryVariantTwo,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4,
            ),
            child: Text(
              '                    ',
              style: locator<FontStyles>().serverItemLeading,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(3, (index) => index).map(
          (channel) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: DiscordButton.withChild(
              onTap: () {},
              backgroundColor: ColorPalette.primaryVariantTwo,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.hashIcon,
                      height: 16,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        ColorPalette.primaryVariantTwo,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '',
                      style: locator<FontStyles>().channelHeadingUnselected,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
