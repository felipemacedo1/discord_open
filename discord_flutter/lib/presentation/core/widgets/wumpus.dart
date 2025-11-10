import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';

class Wumpus extends StatelessWidget {
  const Wumpus({
    super.key,
    required this.text,
    this.width = 600,
  });

  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryVariantTwo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.wumpus,
                width: width,
              ),
            ],
          ),
          Text(
            text,
            style: locator<FontStyles>().serverHeading,
          ),
        ],
      ),
    );
  }
}
