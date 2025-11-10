part of 'channel_cubit.dart';

@freezed
abstract class ChannelState with _$ChannelState {
  factory ChannelState({
    required List<DiscordGroupEntity> groups,
    required bool isLoading,
    required DiscordChannel selectedChannel,
  }) = _ChannelState;
  factory ChannelState.initial() => ChannelState(
        groups: <DiscordGroupEntity>[],
        isLoading: false,
        selectedChannel: DiscordChannel(
          name: '',
          icon: 'hash',
          groupId: -1,
          discordServerId: -1,
          type: GroupType.text,
        ),
      );
}
