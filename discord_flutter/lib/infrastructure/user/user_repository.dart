import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class UserRepository {
  UserRepository({required this.client});

  final Client client;

  Future<DiscordUser> getUser(int userId) async {
    try {
      final user = await client.discordUser.getUserDetails(userId);
      return user;
    } on Exception catch (e) {
      debugPrint('[UserRepository - getUser($userId) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> updateStatus(int userId, ActivityStatus status) async {
    try {
      await client.discordUser.updateUserStatus(userId, status);
    } on Exception catch (e) {
      debugPrint(
          '[UserRepository - updateStatus($userId, $status) ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
