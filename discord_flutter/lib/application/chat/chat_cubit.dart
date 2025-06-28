import 'dart:async';

import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/infrastructure/chat/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.repo}) : super(ChatState.initial());

  final ChatRepository repo;

  //non ui state - we can turn them into state variables as well
  StreamSubscription? chatStreamSubscription;
  Map<String, Message> pendingMessages = {};

  void toggleDrawer() {
    emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));
  }

  void fetchChats(int channelId) async {
    emit(
      state.copyWith(
        isLoading: true,
        // Turn off `hasFetchedPagination flag to keep track of scroll
        hasFetchedPagination: false,
      ),
    );
    await Future.delayed(Durations.extralong4 * 2);
    final discordChannelEntity = await repo.fetchChannelChats(channelId);
    final messages = List<Message>.from(discordChannelEntity.messages);

    // Sort messages by timestamp
    messages.sort(
      (a, b) => a.timeStamp.millisecondsSinceEpoch.compareTo(
        b.timeStamp.millisecondsSinceEpoch,
      ),
    );

    // Group messages by date category
    final groupedMessages = <String, List<Message>>{};
    for (final message in messages) {
      final category = _getDateCategory(message.timeStamp.toLocal());
      groupedMessages.putIfAbsent(category, () => []);
      groupedMessages[category]!.add(message);
    }

    emit(
      state.copyWith(
        messages: groupedMessages,
        isLoading: false,
        endOfMessages: false,
      ),
    );
  }

  void fetchChatsPaginated() async {
    // Do nothing is there is no more data
    if (state.endOfMessages) {
      return;
    }

    // Turn on `hasFetchedPagination flag to keep track of scroll
    emit(
      state.copyWith(
        isPaginationLoading: true,
        hasFetchedPagination: true,
      ),
    );

    // Pick the message with the lowest id for cursor value
    final firstMessage = state.messages.values
        .expand((element) => element)
        .reduce((a, b) => a.id! < b.id! ? a : b);

    // Get the cursor, which is going to be the first message id in the already
    // present chat list
    final cursor = firstMessage.id!;

    // Get the channelId
    final channelId = firstMessage.channelId;

    // Fetch paginatedMessages
    final paginatedMessages = await repo.fetchChatsPaginated(channelId, cursor);

    // If data is less than 15 then we have no more data to fetch
    if (paginatedMessages.length < 15) {
      emit(
        state.copyWith(
          endOfMessages: true,
        ),
      );
    }

    // Group messages by date category
    final groupedMessages = Map<String, List<Message>>.from(state.messages);
    for (final message in paginatedMessages) {
      final category = _getDateCategory(message.timeStamp.toLocal());
      groupedMessages.putIfAbsent(category, () => []);
      groupedMessages[category]!.add(message);
    }

    // Sort the entire map entries based on timestamp
    final sortedEntries = groupedMessages.entries.toList()
      ..sort((a, b) {
        final firstMessageA = a.value.first;
        final firstMessageB = b.value.first;
        return firstMessageA.timeStamp.millisecondsSinceEpoch
            .compareTo(firstMessageB.timeStamp.millisecondsSinceEpoch);
      });

    // Sort all the lists inside the groupedMessages
    for (final entry in sortedEntries) {
      entry.value.sort(
        (a, b) => a.timeStamp.millisecondsSinceEpoch.compareTo(
          b.timeStamp.millisecondsSinceEpoch,
        ),
      );
    }

    // Convert the sorted entries back to a map
    final sortedGroupedMessages =
        Map<String, List<Message>>.fromEntries(sortedEntries);

    emit(
      state.copyWith(
        messages: sortedGroupedMessages,
        isPaginationLoading: false,
      ),
    );
  }

  void listenToMessages(int channelId) async {
    if (chatStreamSubscription != null) {
      chatStreamSubscription?.cancel();
      pendingMessages = {};
    }
    final chatStream = repo.listenToMessages(channelId);

    chatStreamSubscription = chatStream.listen(
      (deliveredMessage) {
        final groupedMessages = Map<String, List<Message>>.from(state.messages);
        final messages = List<Message>.from(groupedMessages['Today'] ?? []);

        final messageKey = _createMessageKey(deliveredMessage);
        if (pendingMessages.containsKey(messageKey)) {
          final pendingMessage = pendingMessages[messageKey];
          pendingMessages.remove(messageKey);
          messages.remove(pendingMessage);
        }

        messages.add(deliveredMessage);
        messages.sort(
          (a, b) => a.timeStamp.millisecondsSinceEpoch.compareTo(
            b.timeStamp.millisecondsSinceEpoch,
          ),
        );

        // Add to grouped messages
        final category = _getDateCategory(deliveredMessage.timeStamp.toLocal());
        groupedMessages.putIfAbsent(category, () => []);
        groupedMessages[category] = messages;

        emit(state.copyWith(messages: groupedMessages));
      },
      onError: (error, stackTrace) {
        debugPrint(
            '[ChatCubit - listenToMessages($channelId) ERROR]: ${error.toString()}');
        debugPrint(
            '[ChatCubit - listenToMessages($channelId) ERROR]: $stackTrace');
      },
      cancelOnError: true,
    );
  }

  void sendMessage(String content, int channelId, DiscordUser user) async {
    if (state.viewingOlderMessages) {
      setOlderMessageView(false);
    }

    final message = Message(
      senderInfo: user.userInfo,
      senderInfoId: user.userInfoId,
      channelId: channelId,
      timeStamp: DateTime.now(),
      content: content,
      contentType: 'text',
      isDelivered: false,
      isDeleted: false,
    );

    final groupedMessages = Map<String, List<Message>>.from(state.messages);
    final messages = List<Message>.from(groupedMessages['Today'] ?? []);

    messages.add(message);

    final category = _getDateCategory(message.timeStamp);
    groupedMessages.putIfAbsent(category, () => []);
    groupedMessages[category] = messages;

    emit(state.copyWith(messages: groupedMessages));
    final messageKey = _createMessageKey(message);
    pendingMessages[messageKey] = message;

    await repo.sendMessage(message);
  }

  String _createMessageKey(Message deliveredMessage) {
    return '${deliveredMessage.senderInfoId}_${deliveredMessage.content}_${deliveredMessage.timeStamp.millisecondsSinceEpoch}';
  }

  String _getDateCategory(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else {
      return DateFormat('MMMM d, y').format(date);
    }
  }

  void setOlderMessageView(bool value) {
    if (!value) {
      emit(state.copyWith(hasFetchedPagination: false));
    }
    emit(state.copyWith(viewingOlderMessages: value));
  }

  void deleteMessage(Message message) async {
    final updatedMessage = await repo.deleteMessage(message);
    final groupedMessages = Map<String, List<Message>>.from(state.messages);
    final category = _getDateCategory(message.timeStamp);
    final messages = List<Message>.from(groupedMessages[category] ?? []);

    final index = messages.indexWhere((m) => m.id == message.id);
    if (index != -1) {
      messages[index] = updatedMessage;
      groupedMessages[category] = messages;
      emit(state.copyWith(messages: groupedMessages));
    }
  }

  void resetToInitial() {
    emit(ChatState.initial());
    if (chatStreamSubscription != null) {
      chatStreamSubscription?.cancel();
      pendingMessages = {};
    }
  }
}
