import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class ChannelRepository {
  ChannelRepository({required this.client});

  final Client client;

  Future<List<DiscordGroupEntity>> fetchChannelGroups(int serverId) async {
    try {
      final groups = await client.discordGroup.getAllGroups(serverId);
      return groups;
    } on Exception catch (e) {
      debugPrint(
          '[ChannelRepository - fetchChannelGroups($serverId) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<DiscordGroupEntity> createChannel(
      int serverId, String name, GroupType type) async {
    try {
      final channel = await client.discordChannel.createChannel(
        serverId,
        name,
        type,
      );
      await Future.delayed(Durations.extralong4 * 2);
      return channel;
    } on Exception catch (e) {
      debugPrint(
          '[ChannelRepository - createChannel($serverId, $name, $type) ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
