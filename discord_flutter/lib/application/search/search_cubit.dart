import 'dart:async';

import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/infrastructure/search/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  Timer? _debounce;
  static const _minQueryLength = 2;
  static const _debounceDuration = Duration(milliseconds: 500);

  SearchCubit({
    required this.searchRepository,
  }) : super(SearchState.initial());

  Future<void> search(String query, int channelId) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(_debounceDuration, () async {
      if (query.isEmpty) {
        emit(state.copyWith(
          searchResults: [],
          query: query,
        ));
        return;
      }

      if (query.length < _minQueryLength) {
        emit(state.copyWith(
          searchResults: [],
          query: query,
          isLoading: false,
        ));
        return;
      }

      emit(state.copyWith(
        isLoading: true,
        searchResults: [],
        query: query,
      ));

      try {
        final results = await searchRepository.searchMessages(
          channelId,
          query,
        );

        emit(state.copyWith(
          searchResults: results,
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }

  void resetToInitial() {
    emit(SearchState.initial());
  }
}
