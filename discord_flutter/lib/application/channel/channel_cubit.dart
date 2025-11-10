import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/infrastructure/channel/channel_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_cubit.freezed.dart';
part 'channel_state.dart';

class ChannelCubit extends Cubit<ChannelState> {
  ChannelCubit({required this.repo}) : super(ChannelState.initial());

  final ChannelRepository repo;

  void setChannel(DiscordChannel channel) {
    emit(
      state.copyWith(
        selectedChannel: channel,
      ),
    );
  }

  void fetchChannelGroups(int serverId, int defaultChannelId) async {
    emit(
      state.copyWith(
        isLoading: true,
        selectedChannel: ChannelState.initial().selectedChannel,
      ),
    );
    await Future.delayed(Durations.extralong4 * 2);
    final groups = await repo.fetchChannelGroups(serverId);

    final channel = groups
        .expand((group) => group.channels)
        .firstWhere((channel) => channel.id == defaultChannelId);
    emit(
      state.copyWith(
        groups: groups,
        isLoading: false,
        selectedChannel: channel,
      ),
    );
  }

  Future<void> createChannel(int serverId, String name, GroupType type) async {
    emit(state.copyWith(isLoading: true));

    final group = await repo.createChannel(serverId, name, type);

    //check if group already exists
    final existingGroup = state.groups.firstWhere(
      (g) => g.group.id == group.group.id,
      orElse: () => group,
    );

    if (existingGroup == group) {
      // If no existing group found, add the new group
      emit(state.copyWith(
        groups: [...state.groups, group],
        isLoading: false,
        selectedChannel: group.channels.first,
      ));
    } else {
      // If group exists, update the existing group with the new channel
      final updatedGroups = state.groups.map((g) {
        if (g.group.id == group.group.id) {
          return g.copyWith(channels: [...g.channels, group.channels.first]);
        }
        return g;
      }).toList();

      emit(state.copyWith(
        groups: updatedGroups,
        isLoading: false,
        selectedChannel: group.channels.first,
      ));
    }
  }
}
