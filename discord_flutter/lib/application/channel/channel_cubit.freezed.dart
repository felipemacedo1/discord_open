// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelState {
  List<DiscordGroupEntity> get groups;
  bool get isLoading;
  DiscordChannel get selectedChannel;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelStateCopyWith<ChannelState> get copyWith =>
      _$ChannelStateCopyWithImpl<ChannelState>(
          this as ChannelState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelState &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedChannel, selectedChannel) ||
                other.selectedChannel == selectedChannel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(groups), isLoading, selectedChannel);

  @override
  String toString() {
    return 'ChannelState(groups: $groups, isLoading: $isLoading, selectedChannel: $selectedChannel)';
  }
}

/// @nodoc
abstract mixin class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
          ChannelState value, $Res Function(ChannelState) _then) =
      _$ChannelStateCopyWithImpl;
  @useResult
  $Res call(
      {List<DiscordGroupEntity> groups,
      bool isLoading,
      DiscordChannel selectedChannel});
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res> implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._self, this._then);

  final ChannelState _self;
  final $Res Function(ChannelState) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? isLoading = null,
    Object? selectedChannel = null,
  }) {
    return _then(_self.copyWith(
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<DiscordGroupEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedChannel: null == selectedChannel
          ? _self.selectedChannel
          : selectedChannel // ignore: cast_nullable_to_non_nullable
              as DiscordChannel,
    ));
  }
}

/// @nodoc

class _ChannelState implements ChannelState {
  _ChannelState(
      {required final List<DiscordGroupEntity> groups,
      required this.isLoading,
      required this.selectedChannel})
      : _groups = groups;

  final List<DiscordGroupEntity> _groups;
  @override
  List<DiscordGroupEntity> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final bool isLoading;
  @override
  final DiscordChannel selectedChannel;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelStateCopyWith<_ChannelState> get copyWith =>
      __$ChannelStateCopyWithImpl<_ChannelState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelState &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedChannel, selectedChannel) ||
                other.selectedChannel == selectedChannel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_groups), isLoading, selectedChannel);

  @override
  String toString() {
    return 'ChannelState(groups: $groups, isLoading: $isLoading, selectedChannel: $selectedChannel)';
  }
}

/// @nodoc
abstract mixin class _$ChannelStateCopyWith<$Res>
    implements $ChannelStateCopyWith<$Res> {
  factory _$ChannelStateCopyWith(
          _ChannelState value, $Res Function(_ChannelState) _then) =
      __$ChannelStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<DiscordGroupEntity> groups,
      bool isLoading,
      DiscordChannel selectedChannel});
}

/// @nodoc
class __$ChannelStateCopyWithImpl<$Res>
    implements _$ChannelStateCopyWith<$Res> {
  __$ChannelStateCopyWithImpl(this._self, this._then);

  final _ChannelState _self;
  final $Res Function(_ChannelState) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groups = null,
    Object? isLoading = null,
    Object? selectedChannel = null,
  }) {
    return _then(_ChannelState(
      groups: null == groups
          ? _self._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<DiscordGroupEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedChannel: null == selectedChannel
          ? _self.selectedChannel
          : selectedChannel // ignore: cast_nullable_to_non_nullable
              as DiscordChannel,
    ));
  }
}

// dart format on
