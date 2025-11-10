// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'right_side_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RightSideBarState {
  bool get isDrawerOpen;
  RightSideBarType get selectedRightSideBarType;

  /// Create a copy of RightSideBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RightSideBarStateCopyWith<RightSideBarState> get copyWith =>
      _$RightSideBarStateCopyWithImpl<RightSideBarState>(
          this as RightSideBarState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RightSideBarState &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(
                    other.selectedRightSideBarType, selectedRightSideBarType) ||
                other.selectedRightSideBarType == selectedRightSideBarType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isDrawerOpen, selectedRightSideBarType);

  @override
  String toString() {
    return 'RightSideBarState(isDrawerOpen: $isDrawerOpen, selectedRightSideBarType: $selectedRightSideBarType)';
  }
}

/// @nodoc
abstract mixin class $RightSideBarStateCopyWith<$Res> {
  factory $RightSideBarStateCopyWith(
          RightSideBarState value, $Res Function(RightSideBarState) _then) =
      _$RightSideBarStateCopyWithImpl;
  @useResult
  $Res call({bool isDrawerOpen, RightSideBarType selectedRightSideBarType});
}

/// @nodoc
class _$RightSideBarStateCopyWithImpl<$Res>
    implements $RightSideBarStateCopyWith<$Res> {
  _$RightSideBarStateCopyWithImpl(this._self, this._then);

  final RightSideBarState _self;
  final $Res Function(RightSideBarState) _then;

  /// Create a copy of RightSideBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDrawerOpen = null,
    Object? selectedRightSideBarType = null,
  }) {
    return _then(_self.copyWith(
      isDrawerOpen: null == isDrawerOpen
          ? _self.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRightSideBarType: null == selectedRightSideBarType
          ? _self.selectedRightSideBarType
          : selectedRightSideBarType // ignore: cast_nullable_to_non_nullable
              as RightSideBarType,
    ));
  }
}

/// @nodoc

class _RightSideBarState implements RightSideBarState {
  _RightSideBarState(
      {required this.isDrawerOpen, required this.selectedRightSideBarType});

  @override
  final bool isDrawerOpen;
  @override
  final RightSideBarType selectedRightSideBarType;

  /// Create a copy of RightSideBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RightSideBarStateCopyWith<_RightSideBarState> get copyWith =>
      __$RightSideBarStateCopyWithImpl<_RightSideBarState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RightSideBarState &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(
                    other.selectedRightSideBarType, selectedRightSideBarType) ||
                other.selectedRightSideBarType == selectedRightSideBarType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isDrawerOpen, selectedRightSideBarType);

  @override
  String toString() {
    return 'RightSideBarState(isDrawerOpen: $isDrawerOpen, selectedRightSideBarType: $selectedRightSideBarType)';
  }
}

/// @nodoc
abstract mixin class _$RightSideBarStateCopyWith<$Res>
    implements $RightSideBarStateCopyWith<$Res> {
  factory _$RightSideBarStateCopyWith(
          _RightSideBarState value, $Res Function(_RightSideBarState) _then) =
      __$RightSideBarStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isDrawerOpen, RightSideBarType selectedRightSideBarType});
}

/// @nodoc
class __$RightSideBarStateCopyWithImpl<$Res>
    implements _$RightSideBarStateCopyWith<$Res> {
  __$RightSideBarStateCopyWithImpl(this._self, this._then);

  final _RightSideBarState _self;
  final $Res Function(_RightSideBarState) _then;

  /// Create a copy of RightSideBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDrawerOpen = null,
    Object? selectedRightSideBarType = null,
  }) {
    return _then(_RightSideBarState(
      isDrawerOpen: null == isDrawerOpen
          ? _self.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRightSideBarType: null == selectedRightSideBarType
          ? _self.selectedRightSideBarType
          : selectedRightSideBarType // ignore: cast_nullable_to_non_nullable
              as RightSideBarType,
    ));
  }
}

// dart format on
