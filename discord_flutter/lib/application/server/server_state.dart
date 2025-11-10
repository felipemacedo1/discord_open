part of 'server_cubit.dart';

@freezed
abstract class ServerState with _$ServerState {
  ServerState._();

  factory ServerState({
    required List<DiscordServer> servers,
    required bool isLoading,
    required bool isDrawerOpen,
    required bool isCreatingServer,
    required DiscordServer selectedServer,
    required List<DiscordServer> searchedServers,
    required bool isSearching,
  }) = _ServerState;
  factory ServerState.initial() => ServerState(
        servers: [],
        isLoading: false,
        isDrawerOpen: false,
        isCreatingServer: false,
        selectedServer: DiscordServer(
          name: '',
          newMessagesCount: 0,
          newMessagesChats: 0,
          serverBackground: '',
        ),
        searchedServers: <DiscordServer>[],
        isSearching: false,
      );

  bool get hasSelectedServer => selectedServer.id != null;
}
