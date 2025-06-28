import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

class LiveStreamRepository {
  LiveStreamRepository({required this.client});

  final Client client;

  Future<String> generateToken({
    required int userId,
    required int channelId,
  }) async {
    try {
      final token = await client.liveStream.generateToken(
        userId.toString(),
        channelId.toString(),
      );
      return token;
    } on Exception catch (e) {
      debugPrint(
          '[LiveStreamRepository - generateToken() ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<Room> createRoom({
    required String url,
    required String token,
  }) async {
    try {
      final roomOptions = RoomOptions(
        adaptiveStream: true,
        dynacast: true,
      );

      final room = Room(
        roomOptions: roomOptions,
      );

      await room.prepareConnection(url, token);

      await room.connect(url, token);

      return room;
    } on Exception catch (e) {
      debugPrint(
          '[LiveStreamRepository - createRoom() ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
