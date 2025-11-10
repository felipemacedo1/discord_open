// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberState {
  bool get isLoading;
  List<DiscordUser> get members;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberStateCopyWith<MemberState> get copyWith =>
      _$MemberStateCopyWithImpl<MemberState>(this as MemberState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(members));

  @override
  String toString() {
    return 'MemberState(isLoading: $isLoading, members: $members)';
  }
}

/// @nodoc
abstract mixin class $MemberStateCopyWith<$Res> {
  factory $MemberStateCopyWith(
          MemberState value, $Res Function(MemberState) _then) =
      _$MemberStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, List<DiscordUser> members});
}

/// @nodoc
class _$MemberStateCopyWithImpl<$Res> implements $MemberStateCopyWith<$Res> {
  _$MemberStateCopyWithImpl(this._self, this._then);

  final MemberState _self;
  final $Res Function(MemberState) _then;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? members = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<DiscordUser>,
    ));
  }
}

/// @nodoc

class _MemberState implements MemberState {
  _MemberState(
      {required this.isLoading, required final List<DiscordUser> members})
      : _members = members;

  @override
  final bool isLoading;
  final List<DiscordUser> _members;
  @override
  List<DiscordUser> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberStateCopyWith<_MemberState> get copyWith =>
      __$MemberStateCopyWithImpl<_MemberState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_members));

  @override
  String toString() {
    return 'MemberState(isLoading: $isLoading, members: $members)';
  }
}

/// @nodoc
abstract mixin class _$MemberStateCopyWith<$Res>
    implements $MemberStateCopyWith<$Res> {
  factory _$MemberStateCopyWith(
          _MemberState value, $Res Function(_MemberState) _then) =
      __$MemberStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, List<DiscordUser> members});
}

/// @nodoc
class __$MemberStateCopyWithImpl<$Res> implements _$MemberStateCopyWith<$Res> {
  __$MemberStateCopyWithImpl(this._self, this._then);

  final _MemberState _self;
  final $Res Function(_MemberState) _then;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? members = null,
  }) {
    return _then(_MemberState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<DiscordUser>,
    ));
  }
}

// dart format on
