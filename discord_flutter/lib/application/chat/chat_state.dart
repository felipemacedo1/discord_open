part of 'chat_cubit.dart';

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState({
    required bool isDrawerOpen,
    required bool isLoading,
    required Map<String, List<Message>> messages,
    required bool endOfMessages,
    required bool isPaginationLoading,
    required bool hasFetchedPagination,
    required bool viewingOlderMessages,
  }) = _ChatState;
  factory ChatState.initial() => ChatState(
        isDrawerOpen: true,
        isLoading: false,
        messages: Map.from(<String, List<Message>>{}),
        endOfMessages: false,
        isPaginationLoading: false,
        hasFetchedPagination: false,
        viewingOlderMessages: false,
      );
}
