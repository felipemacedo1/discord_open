// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerState {
  List<DiscordServer> get servers;
  bool get isLoading;
  bool get isDrawerOpen;
  bool get isCreatingServer;
  DiscordServer get selectedServer;
  List<DiscordServer> get searchedServers;
  bool get isSearching;

  /// Create a copy of ServerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerStateCopyWith<ServerState> get copyWith =>
      _$ServerStateCopyWithImpl<ServerState>(this as ServerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerState &&
            const DeepCollectionEquality().equals(other.servers, servers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(other.isCreatingServer, isCreatingServer) ||
                other.isCreatingServer == isCreatingServer) &&
            (identical(other.selectedServer, selectedServer) ||
                other.selectedServer == selectedServer) &&
            const DeepCollectionEquality()
                .equals(other.searchedServers, searchedServers) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(servers),
      isLoading,
      isDrawerOpen,
      isCreatingServer,
      selectedServer,
      const DeepCollectionEquality().hash(searchedServers),
      isSearching);

  @override
  String toString() {
    return 'ServerState(servers: $servers, isLoading: $isLoading, isDrawerOpen: $isDrawerOpen, isCreatingServer: $isCreatingServer, selectedServer: $selectedServer, searchedServers: $searchedServers, isSearching: $isSearching)';
  }
}

/// @nodoc
abstract mixin class $ServerStateCopyWith<$Res> {
  factory $ServerStateCopyWith(
          ServerState value, $Res Function(ServerState) _then) =
      _$ServerStateCopyWithImpl;
  @useResult
  $Res call(
      {List<DiscordServer> servers,
      bool isLoading,
      bool isDrawerOpen,
      bool isCreatingServer,
      DiscordServer selectedServer,
      List<DiscordServer> searchedServers,
      bool isSearching});
}

/// @nodoc
class _$ServerStateCopyWithImpl<$Res> implements $ServerStateCopyWith<$Res> {
  _$ServerStateCopyWithImpl(this._self, this._then);

  final ServerState _self;
  final $Res Function(ServerState) _then;

  /// Create a copy of ServerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servers = null,
    Object? isLoading = null,
    Object? isDrawerOpen = null,
    Object? isCreatingServer = null,
    Object? selectedServer = null,
    Object? searchedServers = null,
    Object? isSearching = null,
  }) {
    return _then(_self.copyWith(
      servers: null == servers
          ? _self.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<DiscordServer>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDrawerOpen: null == isDrawerOpen
          ? _self.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingServer: null == isCreatingServer
          ? _self.isCreatingServer
          : isCreatingServer // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedServer: null == selectedServer
          ? _self.selectedServer
          : selectedServer // ignore: cast_nullable_to_non_nullable
              as DiscordServer,
      searchedServers: null == searchedServers
          ? _self.searchedServers
          : searchedServers // ignore: cast_nullable_to_non_nullable
              as List<DiscordServer>,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _ServerState extends ServerState {
  _ServerState(
      {required final List<DiscordServer> servers,
      required this.isLoading,
      required this.isDrawerOpen,
      required this.isCreatingServer,
      required this.selectedServer,
      required final List<DiscordServer> searchedServers,
      required this.isSearching})
      : _servers = servers,
        _searchedServers = searchedServers,
        super._();

  final List<DiscordServer> _servers;
  @override
  List<DiscordServer> get servers {
    if (_servers is EqualUnmodifiableListView) return _servers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servers);
  }

  @override
  final bool isLoading;
  @override
  final bool isDrawerOpen;
  @override
  final bool isCreatingServer;
  @override
  final DiscordServer selectedServer;
  final List<DiscordServer> _searchedServers;
  @override
  List<DiscordServer> get searchedServers {
    if (_searchedServers is EqualUnmodifiableListView) return _searchedServers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedServers);
  }

  @override
  final bool isSearching;

  /// Create a copy of ServerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerStateCopyWith<_ServerState> get copyWith =>
      __$ServerStateCopyWithImpl<_ServerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerState &&
            const DeepCollectionEquality().equals(other._servers, _servers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(other.isCreatingServer, isCreatingServer) ||
                other.isCreatingServer == isCreatingServer) &&
            (identical(other.selectedServer, selectedServer) ||
                other.selectedServer == selectedServer) &&
            const DeepCollectionEquality()
                .equals(other._searchedServers, _searchedServers) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_servers),
      isLoading,
      isDrawerOpen,
      isCreatingServer,
      selectedServer,
      const DeepCollectionEquality().hash(_searchedServers),
      isSearching);

  @override
  String toString() {
    return 'ServerState(servers: $servers, isLoading: $isLoading, isDrawerOpen: $isDrawerOpen, isCreatingServer: $isCreatingServer, selectedServer: $selectedServer, searchedServers: $searchedServers, isSearching: $isSearching)';
  }
}

/// @nodoc
abstract mixin class _$ServerStateCopyWith<$Res>
    implements $ServerStateCopyWith<$Res> {
  factory _$ServerStateCopyWith(
          _ServerState value, $Res Function(_ServerState) _then) =
      __$ServerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<DiscordServer> servers,
      bool isLoading,
      bool isDrawerOpen,
      bool isCreatingServer,
      DiscordServer selectedServer,
      List<DiscordServer> searchedServers,
      bool isSearching});
}

/// @nodoc
class __$ServerStateCopyWithImpl<$Res> implements _$ServerStateCopyWith<$Res> {
  __$ServerStateCopyWithImpl(this._self, this._then);

  final _ServerState _self;
  final $Res Function(_ServerState) _then;

  /// Create a copy of ServerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? servers = null,
    Object? isLoading = null,
    Object? isDrawerOpen = null,
    Object? isCreatingServer = null,
    Object? selectedServer = null,
    Object? searchedServers = null,
    Object? isSearching = null,
  }) {
    return _then(_ServerState(
      servers: null == servers
          ? _self._servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<DiscordServer>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDrawerOpen: null == isDrawerOpen
          ? _self.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingServer: null == isCreatingServer
          ? _self.isCreatingServer
          : isCreatingServer // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedServer: null == selectedServer
          ? _self.selectedServer
          : selectedServer // ignore: cast_nullable_to_non_nullable
              as DiscordServer,
      searchedServers: null == searchedServers
          ? _self._searchedServers
          : searchedServers // ignore: cast_nullable_to_non_nullable
              as List<DiscordServer>,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
