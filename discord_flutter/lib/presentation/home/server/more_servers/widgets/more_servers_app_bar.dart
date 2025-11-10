import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreServersAppBar extends StatelessWidget {
  const MoreServersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 480;

    return ColoredBox(
      color: ColorPalette.moreServersAppBar,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: isMobile ? 0 : 16, vertical: 8),
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
                DiscordButton.withChild(
                  splashOnly: true,
                  onTap: () {},
                  backgroundColor: ColorPalette.white.withValues(alpha: 0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      'My Servers',
                      style: locator<FontStyles>().channelHeadingSelected,
                    ),
                  ),
                  // textColor: ColorPalette.white,
                ),
                SizedBox(
                  width: 8,
                ),
                DiscordButton.withChild(
                  splashOnly: true,
                  onTap: () {},
                  // backgroundColor: ColorPalette.white.withValues(alpha: 0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      'Discover',
                      style: locator<FontStyles>().channelHeadingUnselected,
                    ),
                  ),
                  // textColor: ColorPalette.white,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
