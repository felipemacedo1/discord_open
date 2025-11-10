import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/extensions/activity_status_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    this.imgUrl,
    this.onPressed,
    required this.status,
    required this.shape,
    this.size = 48,
  });

  final String? imgUrl;
  final VoidCallback? onPressed;
  final ActivityStatus status;
  final DiscordIconButtonShape shape;
  final double size;

  @override
  Widget build(BuildContext context) {
    final hasImage = imgUrl != null;
    final isActive = status == ActivityStatus.online;

    return Stack(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: DiscordIconButton.filled(
            shape: shape,
            onPressed: onPressed,
            icon: hasImage
                ? CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl!),
                    radius: size / 2,
                  )
                : SvgPicture.asset(
                    Assets.discordLogo,
                    fit: BoxFit.scaleDown,
                    height: size / 2,
                    width: size / 2,
                  ),
          ),
        ),
        Positioned.fill(
          right: 0,
          bottom: isActive ? size * 0.05 : null,
          top: !isActive ? size * 0.05 : null,
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 17,
              width: 17,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: status.getStatusColor,
                  border: Border.all(
                    width: 4,
                    color: ColorPalette.primary,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
