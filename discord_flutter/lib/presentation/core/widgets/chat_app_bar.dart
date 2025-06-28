import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/right_side_bar/right_side_bar_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 480;

    return ColoredBox(
      color: ColorPalette.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 16,
          vertical: 8,
        ),
        child: BlocBuilder<ChannelCubit, ChannelState>(
          buildWhen: (previous, current) =>
              previous.selectedChannel != current.selectedChannel,
          builder: (context, state) {
            return Row(
              children: [
                if (isMobile)
                  IconButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                if (!isMobile)
                  DiscordIconButton(
                    onPressed: () {
                      context.read<ChatCubit>().toggleDrawer();
                    },
                    icon: Image.asset(
                      height: 20,
                      width: 20,
                      Assets.drawer,
                    ),
                  ),
                SvgPicture.asset(
                  state.selectedChannel.icon == 'hash'
                      ? Assets.hashIcon
                      : Assets.voiceIcon,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    ColorPalette.unselectedChannelIcon,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  state.selectedChannel.name,
                  style: locator<FontStyles>().channelHeadingSelected,
                ),
                Spacer(),
                if (!isMobile)
                  DiscordIconButton(
                    onPressed: () {
                      //search this channel
                    },
                    icon: SvgPicture.asset(
                      Assets.notificationSettings,
                      fit: BoxFit.scaleDown,
                      height: 24,
                      width: 24,
                    ),
                  ),
                if (!isMobile)
                  DiscordIconButton(
                    onPressed: () {
                      locator<RightSideBarCubit>()
                          .setSideBarType(RightSideBarType.pinnedMessages);
                    },
                    icon: SvgPicture.asset(
                      Assets.pinnedChats,
                      fit: BoxFit.scaleDown,
                      height: 24,
                      width: 24,
                    ),
                  ),
                if (!isMobile)
                  DiscordIconButton(
                    onPressed: () {
                      locator<RightSideBarCubit>()
                          .setSideBarType(RightSideBarType.search);
                    },
                    icon: SvgPicture.asset(
                      Assets.search,
                      fit: BoxFit.scaleDown,
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        ColorPalette.unselectedChannelIcon,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                if (!isMobile)
                  DiscordIconButton(
                    onPressed: () {
                      final previousType = locator<RightSideBarCubit>()
                          .state
                          .selectedRightSideBarType;

                      locator<RightSideBarCubit>()
                          .setSideBarType(RightSideBarType.members);
                      if (previousType != RightSideBarType.members) {
                        locator<MemberCubit>().fetchMembers(
                          serverId: state.selectedChannel.discordServerId,
                        );
                      }
                    },
                    icon: SvgPicture.asset(
                      Assets.members,
                      fit: BoxFit.scaleDown,
                      height: 24,
                      width: 24,
                    ),
                  ),
                if (!isMobile)
                  DiscordIconButton(
                    onPressed: () {
                      locator<RightSideBarCubit>().toggleSideBar();
                    },
                    icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        Assets.drawerRight,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
