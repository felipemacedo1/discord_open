import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/components/logout_button.dart';
import 'package:discord_flutter/presentation/core/components/profile_button.dart';
import 'package:discord_flutter/presentation/core/components/status_menu.dart';
import 'package:discord_flutter/presentation/core/extensions/activity_status_extensions.dart';
import 'package:discord_flutter/presentation/core/extensions/string_extensions.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final DiscordUser user;
  final bool isCurrentUser;

  const ProfileCard({
    super.key,
    required this.user,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 350,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorPalette.primaryVariantTwo,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar and Status
                    Row(
                      children: [
                        ProfileButton(
                          size: 80,
                          status: user.status,
                          shape: DiscordIconButtonShape.square,
                          imgUrl: user.userInfo?.imageUrl,
                        ),
                      ],
                    ),
                    // Username and Tag
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.userInfo?.userName ?? 'Username',
                          style: locator<FontStyles>().usernameStyle,
                        ),
                      ],
                    ),

                    // Status
                    if (isCurrentUser) ...[
                      Row(
                        children: [
                          Text(
                            'Add your status here',
                            style: locator<FontStyles>().chatStyle,
                          ),
                        ],
                      ),
                    ],

                    // Add Status Button
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorPalette.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            if (isCurrentUser) ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: DiscordButton.withChild(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const StatusMenu(),
                                        );
                                      },
                                      backgroundColor: ColorPalette.divider,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 17,
                                              height: 17,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: user
                                                      .status.getStatusColor,
                                                  border: Border.all(
                                                    width: 4,
                                                    color: ColorPalette.primary,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              user.status.name
                                                  .capitalizeFirstLetter(),
                                              style: locator<FontStyles>()
                                                  .usernameStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: DiscordButton.withChild(
                                      onTap: () {
                                        // Go to edit profile page
                                      },
                                      backgroundColor: ColorPalette.divider,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.edit,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Edit Profile',
                                              style: locator<FontStyles>()
                                                  .usernameStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ] else ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: ColorPalette.divider,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 17,
                                              height: 17,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: user
                                                      .status.getStatusColor,
                                                  border: Border.all(
                                                    width: 4,
                                                    color: ColorPalette.primary,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              user.status.name
                                                  .capitalizeFirstLetter(),
                                              style: locator<FontStyles>()
                                                  .usernameStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),

                    if (isCurrentUser) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LogOutButton(),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
