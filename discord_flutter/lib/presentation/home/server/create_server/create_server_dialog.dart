import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_text_field.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';

class CreateServerDialog extends StatefulWidget {
  const CreateServerDialog({super.key});

  @override
  State<CreateServerDialog> createState() => _CreateServerDialogState();
}

class _CreateServerDialogState extends State<CreateServerDialog> {
  final TextEditingController _serverNameController = TextEditingController();
  final TextEditingController _serverImageUrlController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPalette.primaryVariantTwo,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create Your Server',
                  style: locator<FontStyles>().channelHeadingSelected,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your server is where you and your friends hang out. Make yours and start talking!',
                  style: locator<FontStyles>().chatDateStyle,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: DiscordTextField(
                    controller: _serverNameController,
                    validator: (value) {
                      value = value?.trim();
                      if (value == null || value.isEmpty) {
                        return 'Server name is required';
                      }
                      if (value.length > 32) {
                        return 'Server name must be less than 32 characters';
                      }
                      if (value.length < 3) {
                        return 'Server name cannot be less than 3 characters';
                      }

                      return null;
                    },
                    hintText: 'Enter server name',
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: DiscordTextField(
                    controller: _serverImageUrlController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      final uri = Uri.tryParse(value);
                      if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
                        return 'Please enter a valid URL';
                      }
                      return null;
                    },
                    hintText: 'Enter server image URL',
                  ),
                ),
                const SizedBox(height: 16),
                DiscordButton.withChild(
                  onTap: () {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) return;

                    // TODO: Implement create server logic
                    locator<ServerCubit>().createServer(
                      _serverNameController.text,
                      _serverImageUrlController.text,
                      locator<UserCubit>().state.user.id!,
                    );
                    //close dialog
                    Navigator.of(context).pop();
                    context.router.replacePath('/loading');
                  },
                  // backgroundColor: ColorPalette.success,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Create Server',
                      style: locator<FontStyles>().chatDateStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
