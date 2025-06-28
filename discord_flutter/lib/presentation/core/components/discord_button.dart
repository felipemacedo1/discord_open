import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';

class DiscordButton extends StatelessWidget {
  const DiscordButton._({
    super.key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.splashOnly = false,
  });

  final void Function() onTap;
  final Widget child;
  final Color? backgroundColor;
  final bool splashOnly;

  factory DiscordButton.withLabel({
    Key? key,
    required void Function() onTap,
    required String label,
    Color? backgroundColor,
  }) {
    return DiscordButton._(
      key: key,
      onTap: onTap,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8,
        ),
        child: Text(
          label,
          style: locator<FontStyles>().serverItemLeading,
        ),
      ),
    );
  }

  factory DiscordButton.withChild({
    Key? key,
    required void Function() onTap,
    required Widget child,
    Color? backgroundColor,
    bool splashOnly = false,
  }) {
    return DiscordButton._(
      key: key,
      onTap: onTap,
      backgroundColor: backgroundColor,
      splashOnly: splashOnly,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      type: MaterialType.button,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        hoverColor: splashOnly ? Colors.transparent : ColorPalette.divider,
        focusColor: splashOnly ? Colors.transparent : ColorPalette.divider,
        splashColor: ColorPalette.divider,
        highlightColor: splashOnly ? Colors.transparent : ColorPalette.divider,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
