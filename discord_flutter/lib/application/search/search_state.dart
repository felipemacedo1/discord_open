part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  factory SearchState({
    required List<Message> searchResults,
    required bool isLoading,
    required String query,
  }) = _SearchState;

  factory SearchState.initial() => SearchState(
        searchResults: [],
        isLoading: false,
        query: '',
      );
}
