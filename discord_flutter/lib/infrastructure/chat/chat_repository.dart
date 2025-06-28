import 'package:discord_client/discord_client.dart';
import 'package:flutter/material.dart';

class ChatRepository {
  ChatRepository({required this.client});

  final Client client;

  Future<DiscordChannelEntity> fetchChannelChats(int channelId) async {
    try {
      final messages = await client.discordChannel.getChannelById(channelId);
      return messages;
    } on Exception catch (e) {
      debugPrint(
          '[ChatRepository - fetchChannelChats($channelId) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<List<Message>> fetchChatsPaginated(int channelId, int cursor) async {
    try {
      final messages =
          await client.message.fetchChatsPaginated(channelId, cursor);
      await Future.delayed(Duration(seconds: 4));
      return messages;
    } on Exception catch (e) {
      debugPrint(
          '[ChatRepository - fetchChatsPaginated($channelId, $cursor) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Stream<Message> listenToMessages(int channelId) =>
      client.message.listenToMessages(channelId);

  Future<Message> sendMessage(Message message) async {
    try {
      await Future.delayed(Durations.extralong4 * 2);
      final updatedMessage = await client.message.sendMessage(message);
      return updatedMessage;
    } on Exception catch (e) {
      debugPrint(
          '[ChatRepository - sendMessage($message) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<Message> deleteMessage(Message message) async {
    try {
      final updatedMessage = await client.message.deleteMessage(message.id!);
      return updatedMessage;
    } on Exception catch (e) {
      debugPrint(
          '[ChatRepository - deleteMessage($message) ERROR]: ${e.toString()}');
      rethrow;
    }
  }

  Future<Message> editMessage(Message message) async {
    try {
      final updatedMessage =
          await client.message.editMessage(message.id!, message.content);
      return updatedMessage;
    } on Exception catch (e) {
      debugPrint(
          '[ChatRepository - editMessage($message) ERROR]: ${e.toString()}');
      rethrow;
    }
  }
}
