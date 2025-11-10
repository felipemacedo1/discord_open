import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:flutter/material.dart';

enum DiscordIconButtonShape {
  square,
  circle,
}

class DiscordIconButton extends StatelessWidget {
  const DiscordIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isFilled = false,
    this.tooltip,
    this.backgroundColor,
    this.shape = DiscordIconButtonShape.circle,
  });

  final void Function()? onPressed;
  final Widget icon;
  final bool isFilled;
  final String? tooltip;
  final Color? backgroundColor;

  final DiscordIconButtonShape shape;

  factory DiscordIconButton.filled({
    required void Function()? onPressed,
    required Widget icon,
    String? tooltip,
    Color? backgroundColor,
    DiscordIconButtonShape shape = DiscordIconButtonShape.circle,
  }) =>
      DiscordIconButton(
        onPressed: onPressed,
        icon: icon,
        isFilled: true,
        tooltip: tooltip,
        backgroundColor: backgroundColor,
        shape: shape,
      );

  static const _shape = WidgetStateProperty<OutlinedBorder?>.fromMap(
    {
      WidgetState.hovered: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    },
  );
  static const size = WidgetStatePropertyAll(Size(24, 24));
  static const tapTargetSize = MaterialTapTargetSize.shrinkWrap;

  @override
  Widget build(BuildContext context) {
    if (isFilled) {
      return Tooltip(
        message: tooltip ?? '',
        preferBelow: false,
        child: IconButton.filled(
          color: backgroundColor,
          style: ButtonStyle(
            shape: shape == DiscordIconButtonShape.square
                ? WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  )
                : _shape,
            fixedSize: size,
            padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
            backgroundColor:
                WidgetStatePropertyAll(backgroundColor ?? ColorPalette.divider),
            tapTargetSize: tapTargetSize,
          ),
          onPressed: onPressed,
          icon: icon,
        ),
      );
    }
    return Tooltip(
      message: tooltip ?? '',
      preferBelow: false,
      child: IconButton(
        style: ButtonStyle(
          shape: shape == DiscordIconButtonShape.square
              ? WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                )
              : _shape,
          fixedSize: size,
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          tapTargetSize: tapTargetSize,
        ),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
