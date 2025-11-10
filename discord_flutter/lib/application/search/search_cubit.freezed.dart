// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchState {
  List<Message> get searchResults;
  bool get isLoading;
  String get query;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
            const DeepCollectionEquality()
                .equals(other.searchResults, searchResults) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(searchResults), isLoading, query);

  @override
  String toString() {
    return 'SearchState(searchResults: $searchResults, isLoading: $isLoading, query: $query)';
  }
}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) _then) =
      _$SearchStateCopyWithImpl;
  @useResult
  $Res call({List<Message> searchResults, bool isLoading, String query});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
    Object? isLoading = null,
    Object? query = null,
  }) {
    return _then(_self.copyWith(
      searchResults: null == searchResults
          ? _self.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SearchState implements SearchState {
  _SearchState(
      {required final List<Message> searchResults,
      required this.isLoading,
      required this.query})
      : _searchResults = searchResults;

  final List<Message> _searchResults;
  @override
  List<Message> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  final bool isLoading;
  @override
  final String query;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_searchResults), isLoading, query);

  @override
  String toString() {
    return 'SearchState(searchResults: $searchResults, isLoading: $isLoading, query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) _then) =
      __$SearchStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Message> searchResults, bool isLoading, String query});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? searchResults = null,
    Object? isLoading = null,
    Object? query = null,
  }) {
    return _then(_SearchState(
      searchResults: null == searchResults
          ? _self._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
