import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/presentation/home/chat/chat_section.dart';
import 'package:discord_flutter/presentation/home/live_stream/live_stream_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class Channel extends StatelessWidget {
  final String serverId;
  final String channelId;

  const Channel({
    super.key,
    @PathParam('serverId') required this.serverId,
    @PathParam('channelId') required this.channelId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelCubit, ChannelState>(
        buildWhen: (previous, current) =>
            previous.selectedChannel != current.selectedChannel,
        builder: (context, state) {
          final channelIcon = state.selectedChannel.icon;
          final isTextChannel = channelIcon == 'hash';

          if (isTextChannel) {
            return ChatSection();
          }
          return LiveStreamView();
        });
  }
}
