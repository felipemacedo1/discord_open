// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_stream_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveStreamState {
  bool get isConnecting;
  Room get streamRoom;
  List<Participant<TrackPublication<Track>>> get participants;
  bool get microphoneEnabled;
  bool get speakerEnabled;
  bool get cameraEnabled;
  bool get screenShareEnabled;
  bool get connectedToChannel;
  bool get showOverlay;

  /// Create a copy of LiveStreamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveStreamStateCopyWith<LiveStreamState> get copyWith =>
      _$LiveStreamStateCopyWithImpl<LiveStreamState>(
          this as LiveStreamState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveStreamState &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting) &&
            (identical(other.streamRoom, streamRoom) ||
                other.streamRoom == streamRoom) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            (identical(other.microphoneEnabled, microphoneEnabled) ||
                other.microphoneEnabled == microphoneEnabled) &&
            (identical(other.speakerEnabled, speakerEnabled) ||
                other.speakerEnabled == speakerEnabled) &&
            (identical(other.cameraEnabled, cameraEnabled) ||
                other.cameraEnabled == cameraEnabled) &&
            (identical(other.screenShareEnabled, screenShareEnabled) ||
                other.screenShareEnabled == screenShareEnabled) &&
            (identical(other.connectedToChannel, connectedToChannel) ||
                other.connectedToChannel == connectedToChannel) &&
            (identical(other.showOverlay, showOverlay) ||
                other.showOverlay == showOverlay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isConnecting,
      streamRoom,
      const DeepCollectionEquality().hash(participants),
      microphoneEnabled,
      speakerEnabled,
      cameraEnabled,
      screenShareEnabled,
      connectedToChannel,
      showOverlay);

  @override
  String toString() {
    return 'LiveStreamState(isConnecting: $isConnecting, streamRoom: $streamRoom, participants: $participants, microphoneEnabled: $microphoneEnabled, speakerEnabled: $speakerEnabled, cameraEnabled: $cameraEnabled, screenShareEnabled: $screenShareEnabled, connectedToChannel: $connectedToChannel, showOverlay: $showOverlay)';
  }
}

/// @nodoc
abstract mixin class $LiveStreamStateCopyWith<$Res> {
  factory $LiveStreamStateCopyWith(
          LiveStreamState value, $Res Function(LiveStreamState) _then) =
      _$LiveStreamStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isConnecting,
      Room streamRoom,
      List<Participant<TrackPublication<Track>>> participants,
      bool microphoneEnabled,
      bool speakerEnabled,
      bool cameraEnabled,
      bool screenShareEnabled,
      bool connectedToChannel,
      bool showOverlay});
}

/// @nodoc
class _$LiveStreamStateCopyWithImpl<$Res>
    implements $LiveStreamStateCopyWith<$Res> {
  _$LiveStreamStateCopyWithImpl(this._self, this._then);

  final LiveStreamState _self;
  final $Res Function(LiveStreamState) _then;

  /// Create a copy of LiveStreamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnecting = null,
    Object? streamRoom = null,
    Object? participants = null,
    Object? microphoneEnabled = null,
    Object? speakerEnabled = null,
    Object? cameraEnabled = null,
    Object? screenShareEnabled = null,
    Object? connectedToChannel = null,
    Object? showOverlay = null,
  }) {
    return _then(_self.copyWith(
      isConnecting: null == isConnecting
          ? _self.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      streamRoom: null == streamRoom
          ? _self.streamRoom
          : streamRoom // ignore: cast_nullable_to_non_nullable
              as Room,
      participants: null == participants
          ? _self.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant<TrackPublication<Track>>>,
      microphoneEnabled: null == microphoneEnabled
          ? _self.microphoneEnabled
          : microphoneEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      speakerEnabled: null == speakerEnabled
          ? _self.speakerEnabled
          : speakerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraEnabled: null == cameraEnabled
          ? _self.cameraEnabled
          : cameraEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      screenShareEnabled: null == screenShareEnabled
          ? _self.screenShareEnabled
          : screenShareEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedToChannel: null == connectedToChannel
          ? _self.connectedToChannel
          : connectedToChannel // ignore: cast_nullable_to_non_nullable
              as bool,
      showOverlay: null == showOverlay
          ? _self.showOverlay
          : showOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _LiveStreamState implements LiveStreamState {
  _LiveStreamState(
      {required this.isConnecting,
      required this.streamRoom,
      required final List<Participant<TrackPublication<Track>>> participants,
      required this.microphoneEnabled,
      required this.speakerEnabled,
      required this.cameraEnabled,
      required this.screenShareEnabled,
      required this.connectedToChannel,
      required this.showOverlay})
      : _participants = participants;

  @override
  final bool isConnecting;
  @override
  final Room streamRoom;
  final List<Participant<TrackPublication<Track>>> _participants;
  @override
  List<Participant<TrackPublication<Track>>> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final bool microphoneEnabled;
  @override
  final bool speakerEnabled;
  @override
  final bool cameraEnabled;
  @override
  final bool screenShareEnabled;
  @override
  final bool connectedToChannel;
  @override
  final bool showOverlay;

  /// Create a copy of LiveStreamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveStreamStateCopyWith<_LiveStreamState> get copyWith =>
      __$LiveStreamStateCopyWithImpl<_LiveStreamState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveStreamState &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting) &&
            (identical(other.streamRoom, streamRoom) ||
                other.streamRoom == streamRoom) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.microphoneEnabled, microphoneEnabled) ||
                other.microphoneEnabled == microphoneEnabled) &&
            (identical(other.speakerEnabled, speakerEnabled) ||
                other.speakerEnabled == speakerEnabled) &&
            (identical(other.cameraEnabled, cameraEnabled) ||
                other.cameraEnabled == cameraEnabled) &&
            (identical(other.screenShareEnabled, screenShareEnabled) ||
                other.screenShareEnabled == screenShareEnabled) &&
            (identical(other.connectedToChannel, connectedToChannel) ||
                other.connectedToChannel == connectedToChannel) &&
            (identical(other.showOverlay, showOverlay) ||
                other.showOverlay == showOverlay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isConnecting,
      streamRoom,
      const DeepCollectionEquality().hash(_participants),
      microphoneEnabled,
      speakerEnabled,
      cameraEnabled,
      screenShareEnabled,
      connectedToChannel,
      showOverlay);

  @override
  String toString() {
    return 'LiveStreamState(isConnecting: $isConnecting, streamRoom: $streamRoom, participants: $participants, microphoneEnabled: $microphoneEnabled, speakerEnabled: $speakerEnabled, cameraEnabled: $cameraEnabled, screenShareEnabled: $screenShareEnabled, connectedToChannel: $connectedToChannel, showOverlay: $showOverlay)';
  }
}

/// @nodoc
abstract mixin class _$LiveStreamStateCopyWith<$Res>
    implements $LiveStreamStateCopyWith<$Res> {
  factory _$LiveStreamStateCopyWith(
          _LiveStreamState value, $Res Function(_LiveStreamState) _then) =
      __$LiveStreamStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isConnecting,
      Room streamRoom,
      List<Participant<TrackPublication<Track>>> participants,
      bool microphoneEnabled,
      bool speakerEnabled,
      bool cameraEnabled,
      bool screenShareEnabled,
      bool connectedToChannel,
      bool showOverlay});
}

/// @nodoc
class __$LiveStreamStateCopyWithImpl<$Res>
    implements _$LiveStreamStateCopyWith<$Res> {
  __$LiveStreamStateCopyWithImpl(this._self, this._then);

  final _LiveStreamState _self;
  final $Res Function(_LiveStreamState) _then;

  /// Create a copy of LiveStreamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isConnecting = null,
    Object? streamRoom = null,
    Object? participants = null,
    Object? microphoneEnabled = null,
    Object? speakerEnabled = null,
    Object? cameraEnabled = null,
    Object? screenShareEnabled = null,
    Object? connectedToChannel = null,
    Object? showOverlay = null,
  }) {
    return _then(_LiveStreamState(
      isConnecting: null == isConnecting
          ? _self.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      streamRoom: null == streamRoom
          ? _self.streamRoom
          : streamRoom // ignore: cast_nullable_to_non_nullable
              as Room,
      participants: null == participants
          ? _self._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant<TrackPublication<Track>>>,
      microphoneEnabled: null == microphoneEnabled
          ? _self.microphoneEnabled
          : microphoneEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      speakerEnabled: null == speakerEnabled
          ? _self.speakerEnabled
          : speakerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraEnabled: null == cameraEnabled
          ? _self.cameraEnabled
          : cameraEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      screenShareEnabled: null == screenShareEnabled
          ? _self.screenShareEnabled
          : screenShareEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedToChannel: null == connectedToChannel
          ? _self.connectedToChannel
          : connectedToChannel // ignore: cast_nullable_to_non_nullable
              as bool,
      showOverlay: null == showOverlay
          ? _self.showOverlay
          : showOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
