import 'package:discord_flutter/configs.dart';
import 'package:discord_flutter/infrastructure/live_stream/live_stream_repository.dart';
import 'package:discord_flutter/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livekit_client/livekit_client.dart';

part 'live_stream_cubit.freezed.dart';
part 'live_stream_state.dart';

class LiveStreamCubit extends Cubit<LiveStreamState> {
  LiveStreamCubit({
    required this.repo,
  }) : super(LiveStreamState.initial());

  final LiveStreamRepository repo;

  void joinRoom(int userId, int channelId) async {
    emit(
      LiveStreamState.initial().copyWith(
        isConnecting: true,
        microphoneEnabled: state.microphoneEnabled,
        speakerEnabled: state.speakerEnabled,
        cameraEnabled: state.cameraEnabled,
        screenShareEnabled: state.screenShareEnabled,
      ),
    );

    final url = locator<Configs>().liveKitUrl;

    final token = await repo.generateToken(
      userId: userId,
      channelId: channelId,
    );

    final room = await repo.createRoom(url: url, token: token);

    try {
      // These will be handled from the profile section
      await room.localParticipant?.setCameraEnabled(false);
    } catch (error) {
      debugPrint('Could not publish video, error: $error');
    }

    room.localParticipant?.setMicrophoneEnabled(state.microphoneEnabled);
    room.setSpeakerOn(state.speakerEnabled);
    room.localParticipant?.setScreenShareEnabled(false);

    final participants = <Participant>[
      room.localParticipant!,
      ...room.remoteParticipants.values,
    ];

    room.createListener()
      ..on<RoomDisconnectedEvent>((e) {
        if (e.reason == DisconnectReason.clientInitiated) {
          final localParticipant = state.participants.firstWhere(
            (participant) => participant is LocalParticipant,
          );
          _removeParticipant(localParticipant);
        }
        //handle other states
      })
      ..on<ParticipantDisconnectedEvent>(
        (e) => _removeParticipant(e.participant),
      )
      ..on<ParticipantConnectedEvent>(
        (e) => _addParticipant(e.participant),
      );

    emit(
      state.copyWith(
        streamRoom: room,
        isConnecting: false,
        participants: participants,
        connectedToChannel: true,
      ),
    );
  }

  void _removeParticipant(Participant participant) {
    final participants = List<Participant>.from(state.participants);
    participants.removeWhere((item) => item.identity == participant.identity);
    emit(
      state.copyWith(
        participants: participants,
      ),
    );
  }

  void _addParticipant(Participant participant) {
    final participants = List<Participant>.from(state.participants);
    participants.add(participant);
    emit(
      state.copyWith(
        participants: participants,
      ),
    );
  }

  void disconnect() async {
    final room = state.streamRoom;

    await room.disconnect();

    emit(state.copyWith(
      connectedToChannel: false,
      streamRoom: room,
    ));
  }

  void toggleMicrophone() async {
    emit(state.copyWith(
      microphoneEnabled: !state.microphoneEnabled,
    ));

    state.streamRoom.localParticipant?.setMicrophoneEnabled(
      state.microphoneEnabled,
    );
  }

  void toggleSpeaker() {
    emit(state.copyWith(
      speakerEnabled: !state.speakerEnabled,
    ));

    state.streamRoom.setSpeakerOn(state.speakerEnabled);
  }

  void toggleCamera() {
    emit(state.copyWith(
      cameraEnabled: !state.cameraEnabled,
    ));

    state.streamRoom.localParticipant?.setCameraEnabled(state.cameraEnabled);
  }

  void toggleScreenShare() async {
    emit(state.copyWith(
      screenShareEnabled: !state.screenShareEnabled,
    ));

    state.streamRoom.localParticipant?.setScreenShareEnabled(
      state.screenShareEnabled,
    );
  }

  void showOverlay() {
    emit(state.copyWith(
      showOverlay: true,
    ));
  }

  void hideOverlay() {
    emit(state.copyWith(
      showOverlay: false,
    ));
  }

  void resetToInitial() {
    emit(LiveStreamState.initial());
  }
}
