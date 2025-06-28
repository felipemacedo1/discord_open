import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class SearchRepository {
  SearchRepository({required this.client});

  final Client client;

  Future<List<Message>> searchMessages(
    int channelId,
    String query, {
    int? limit = 20,
    int? offset = 0,
  }) async {
    try {
      final messages = await client.search.searchMessages(
        channelId,
        query,
        limit: limit,
        offset: offset,
      );
      await Future.delayed(const Duration(seconds: 2));
      return messages;
    } on Exception catch (e) {
      debugPrint(
          '[SearchRepository - searchMessages() ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
