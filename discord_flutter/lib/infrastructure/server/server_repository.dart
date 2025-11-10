import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class ServerRepository {
  ServerRepository({required this.client});

  final Client client;

  Future<List<DiscordServer>> fetchServers({
    required int userId,
  }) async {
    try {
      final servers = await client.discordServer.getAllServers(userId: userId);
      return servers;
    } on Exception catch (e) {
      debugPrint('[ServerRepository - fetchServers() ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<DiscordServer> createServer({
    required String serverName,
    required String serverBackground,
    required int userId,
  }) async {
    try {
      final createdServer = await client.discordServer.createServer(
        serverName: serverName,
        serverBackground: serverBackground,
        creatorId: userId,
      );
      return createdServer;
    } on Exception catch (e) {
      debugPrint('[ServerRepository - createServer() ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
