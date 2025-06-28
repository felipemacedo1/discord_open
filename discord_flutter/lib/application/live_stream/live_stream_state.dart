part of 'live_stream_cubit.dart';

@freezed
abstract class LiveStreamState with _$LiveStreamState {
  factory LiveStreamState({
    required bool isConnecting,
    required Room streamRoom,
    required List<Participant<TrackPublication<Track>>> participants,
    required bool microphoneEnabled,
    required bool speakerEnabled,
    required bool cameraEnabled,
    required bool screenShareEnabled,
    required bool connectedToChannel,
    required bool showOverlay,
  }) = _LiveStreamState;
  factory LiveStreamState.initial() => LiveStreamState(
        isConnecting: false,
        participants: <Participant>[],
        streamRoom: Room(),
        microphoneEnabled: false,
        speakerEnabled: false,
        cameraEnabled: false,
        screenShareEnabled: false,
        connectedToChannel: false,
        showOverlay: false,
      );
}
