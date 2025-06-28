import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class DiscordServerIcon extends StatefulWidget {
  const DiscordServerIcon(
      {super.key,
      required this.server,
      required this.onTap,
      required this.isSelected,
      this.tooltip});

  final DiscordServer server;
  final void Function()? onTap;
  final bool isSelected;
  final String? tooltip;

  @override
  State<DiscordServerIcon> createState() => DiscordServerIconState();
}

class DiscordServerIconState extends State<DiscordServerIcon> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      message: widget.tooltip ?? widget.server.name,
      child: InkWell(
        onTap: widget.onTap,
        onHover: (isHovered) {
          setState(() {
            hovered = isHovered;
          });
        },
        child: AnimatedContainer(
          height: 40,
          width: 40,
          duration: Durations.short4,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: widget.isSelected
                ? BorderRadius.circular(10)
                : hovered
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(40),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.server.serverBackground),
            ),
          ),
        ),
      ),
    );
  }
}
