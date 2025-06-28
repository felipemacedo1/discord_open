import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/extensions/activity_status_extensions.dart';
import 'package:discord_flutter/presentation/core/extensions/string_extensions.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusMenu extends StatelessWidget {
  const StatusMenu({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Set Status',
                      style: locator<FontStyles>().usernameStyle,
                    ),
                    const SizedBox(height: 16),
                    ...ActivityStatus.values.map(
                      (status) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DiscordButton.withChild(
                          onTap: () {
                            context.read<UserCubit>().updateStatus(status);
                            Navigator.pop(context);
                          },
                          backgroundColor: ColorPalette.divider,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 17,
                                  height: 17,
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
                                const SizedBox(width: 8),
                                Text(
                                  status.name.capitalizeFirstLetter(),
                                  style: locator<FontStyles>().usernameStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
