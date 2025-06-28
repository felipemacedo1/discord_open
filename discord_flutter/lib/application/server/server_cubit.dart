import 'dart:async';

import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/infrastructure/server/server_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_cubit.freezed.dart';
part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {
  ServerCubit({required this.repo}) : super(ServerState.initial());

  final ServerRepository repo;
  Timer? _debounceTimer;
  static const int _minSearchLength = 2;
  static const Duration _debounceDuration = Duration(milliseconds: 300);

  void fetchServers(int userId) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Durations.extralong4 * 2);
    final servers = await repo.fetchServers(userId: userId);
    emit(state.copyWith(
      servers: servers,
      isLoading: false,
      selectedServer: servers.first,
      searchedServers: servers,
    ));
  }

  void toggleDrawer() {
    emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));
  }

  void createServer(
      String serverName, String serverBackground, int userId) async {
    emit(state.copyWith(isCreatingServer: true));
    final server = await repo.createServer(
      serverName: serverName,
      serverBackground: serverBackground,
      userId: userId,
    );
    await Future.delayed(Durations.extralong4 * 2);
    emit(state.copyWith(
      selectedServer: server,
      servers: [...state.servers, server],
      isCreatingServer: false,
    ));
  }

  void setSelectedServer(DiscordServer server) {
    emit(state.copyWith(selectedServer: server));
  }

  void resetToInitial() {
    emit(ServerState.initial());
  }

  void searchServers(String query) async {
    emit(state.copyWith(isSearching: true));
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    if (query.isEmpty) {
      emit(state.copyWith(
        searchedServers: state.servers,
        isSearching: false,
      ));
      return;
    }

    if (query.length < _minSearchLength) {
      emit(state.copyWith(
        searchedServers: state.servers,
        isSearching: false,
      ));
      return;
    }

    _debounceTimer = Timer(_debounceDuration, () async {
      final searchedServers = state.servers
          .where((server) =>
              server.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(
        state.copyWith(
          searchedServers: searchedServers,
          isSearching: false,
        ),
      );
    });
  }

  void resetSearch() {
    emit(state.copyWith(
      searchedServers: state.servers,
      isSearching: false,
    ));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
