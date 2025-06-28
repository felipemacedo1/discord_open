import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class MemberRepository {
  MemberRepository({required this.client});

  final Client client;

  Future<List<DiscordUser>> getMembers({
    required int serverId,
  }) async {
    try {
      final members = await client.discordUser.getUsers(serverId);
      await Future.delayed(const Duration(seconds: 2));
      return members;
    } on Exception catch (e) {
      debugPrint(
          '[MemberRepository - getMembers($serverId) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> addMemberToServer({
    required int serverId,
    required int userId,
  }) async {
    try {
      await client.discordUser.addMemberToServer(serverId, userId);
    } on Exception catch (e) {
      debugPrint(
          '[MemberRepository - addMemberToServer($serverId, $userId) ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
