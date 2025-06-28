import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/right_side_bar/right_side_bar_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/home/right_side_bar/members_side_bar.dart';
import 'package:discord_flutter/presentation/home/right_side_bar/pinned_messages_side_bar.dart';
import 'package:discord_flutter/presentation/home/right_side_bar/search/search_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightSideBar extends StatelessWidget {
  const RightSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorPalette.primaryVariantOne,
      child: BlocBuilder<RightSideBarCubit, RightSideBarState>(
        buildWhen: (previous, current) =>
            previous.selectedRightSideBarType !=
                current.selectedRightSideBarType ||
            previous.isDrawerOpen != current.isDrawerOpen,
        builder: (context, state) {
          return AnimatedSize(
            curve: Curves.fastOutSlowIn,
            duration: Durations.long4,
            child: SizedBox(
              width: state.isDrawerOpen ? 250 : 0,
              child: _SideBarContent(
                state.selectedRightSideBarType,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SideBarContent extends StatelessWidget {
  const _SideBarContent(this.type);

  final RightSideBarType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case RightSideBarType.members:
        return const MembersSideBar();
      case RightSideBarType.pinnedMessages:
        return const PinnedMessagesSideBar();
      case RightSideBarType.search:
        final channelId = locator<ChannelCubit>().state.selectedChannel.id;
        if (channelId == null) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorPalette.white,
            ),
          );
        }
        return SearchSideBar(channelId: channelId);
      case RightSideBarType.none:
        return const SizedBox.shrink();
    }
  }
}
