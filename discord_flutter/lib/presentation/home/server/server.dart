import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/presentation/core/widgets/channel_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Server extends StatelessWidget {
  final String serverId;

  const Server({super.key, @PathParam('serverId') required this.serverId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth <= 480;

      return Row(
        children: [
          if (isMobile)
            Expanded(
              child: ChannelBar(
                serverId: serverId,
              ),
            )
          else
            ChannelBar(
              serverId: serverId,
            ),
          if (!isMobile) Expanded(child: AutoRouter()),
        ],
      );
    });
  }
}
