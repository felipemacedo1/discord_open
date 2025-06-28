import 'package:auto_route/auto_route.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_text_field.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateChannelDialog extends StatefulWidget {
  final int serverId;
  final int groupId;

  const CreateChannelDialog({
    super.key,
    required this.serverId,
    required this.groupId,
  });

  @override
  State<CreateChannelDialog> createState() => _CreateChannelDialogState();
}

class _CreateChannelDialogState extends State<CreateChannelDialog> {
  final TextEditingController _channelNameController = TextEditingController();
  var _channelType = GroupType.text;
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
                  'Create Channel',
                  style: locator<FontStyles>().channelHeadingSelected,
                ),
                const SizedBox(height: 8),
                Text(
                  'Create a new channel for your server',
                  style: locator<FontStyles>().chatDateStyle,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: DiscordTextField(
                    controller: _channelNameController,
                    validator: (value) {
                      value = value?.trim();
                      if (value == null || value.isEmpty) {
                        return 'Channel name is required';
                      }
                      if (value.length > 32) {
                        return 'Channel name must be less than 32 characters';
                      }
                      if (value.length < 3) {
                        return 'Channel name cannot be less than 3 characters';
                      }
                      return null;
                    },
                    hintText: 'Enter channel name',
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'Channel Type',
                        style: locator<FontStyles>().chatDateStyle,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<GroupType>(
                              title: Text(
                                'Text Channel',
                                style: locator<FontStyles>().chatDateStyle,
                              ),
                              activeColor: ColorPalette.white,
                              fillColor: WidgetStateProperty.all(
                                ColorPalette.white,
                              ),
                              value: GroupType.text,
                              groupValue: _channelType,
                              onChanged: (value) {
                                setState(() {
                                  _channelType = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<GroupType>(
                              activeColor: ColorPalette.white,
                              fillColor: WidgetStateProperty.all(
                                ColorPalette.white,
                              ),
                              title: Text(
                                'Voice Channel',
                                style: locator<FontStyles>().chatDateStyle,
                              ),
                              value: GroupType.voice,
                              groupValue: _channelType,
                              onChanged: (value) {
                                setState(() {
                                  _channelType = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                BlocConsumer<ChannelCubit, ChannelState>(
                  listenWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  listener: (context, state) {
                    if (state.groups.isNotEmpty && !state.isLoading) {
                      _navigateToChannel(state.selectedChannel);
                      Navigator.pop(context);
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    return DiscordButton.withChild(
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) return;

                        locator<ChannelCubit>().createChannel(
                          widget.serverId,
                          _channelNameController.text,
                          _channelType,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: state.isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: ColorPalette.white,
                                ),
                              )
                            : Text(
                                'Create Channel',
                                style: locator<FontStyles>().chatDateStyle,
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToChannel(DiscordChannel selectedChannel) {
    final channel = selectedChannel;

    final channelId = channel.id;
    final channelIsText = channel.type == GroupType.text;

    if (channelIsText && channelId != null) {
      locator<ChatCubit>().fetchChats(channelId);
      locator<ChatCubit>().listenToMessages(channelId);
      context.router
          .replacePath('/home/servers/${widget.serverId}/channels/$channelId');
    }
  }
}
