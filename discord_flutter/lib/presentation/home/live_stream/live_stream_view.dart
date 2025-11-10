import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/live_stream/live_stream_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;
import 'package:livekit_client/livekit_client.dart';

class LiveStreamView extends StatelessWidget {
  const LiveStreamView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 480;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<LiveStreamCubit, LiveStreamState>(
        buildWhen: (previous, current) =>
            previous.showOverlay != current.showOverlay,
        builder: (context, state) {
          final showOverlay = state.showOverlay;
          // final isConnected = state.connectedToChannel;

          return GestureDetector(
            onTap: () {
              //show overlay for 5 seconds then hide it
              locator<LiveStreamCubit>().showOverlay();
              Future.delayed(Duration(seconds: 5), () {
                locator<LiveStreamCubit>().hideOverlay();
              });
            },
            child: MouseRegion(
              onEnter: (_) => locator<LiveStreamCubit>().showOverlay(),
              onExit: (_) => locator<LiveStreamCubit>().hideOverlay(),
              child: Column(
                children: [
                  if (isMobile)
                    SizedBox(
                      height: kToolbarHeight,
                    ),
                  ChatAppBar(),
                  Expanded(
                    child: BlocBuilder<LiveStreamCubit, LiveStreamState>(
                      buildWhen: (previous, current) =>
                          previous.participants != current.participants,
                      builder: (context, state) {
                        final participants = state.participants.length;
                        final isConnecting = state.isConnecting;
                        final participantsEmpty = state.participants.isEmpty;

                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: kToolbarHeight + 16,
                              ),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  if (isConnecting) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPalette.white,
                                      ),
                                    );
                                  }

                                  if (participantsEmpty) {
                                    //Show the voice channel view
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('No one is currently in voice'),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        DiscordButton.withLabel(
                                          backgroundColor: ColorPalette.divider,
                                          onTap: () {
                                            final channelId =
                                                locator<ChannelCubit>()
                                                    .state
                                                    .selectedChannel
                                                    .id;

                                            final userId = locator<UserCubit>()
                                                .state
                                                .user
                                                .id;

                                            locator<LiveStreamCubit>().joinRoom(
                                              userId!,
                                              channelId!,
                                            );
                                          },
                                          label: 'Join Voice',
                                        ),
                                      ],
                                    );
                                  }

                                  if (participants > 4) {
                                    // TODO: Need to work on this later
                                    // Grid layout for more than 4 participants
                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            participants <= 9 ? 3 : 4,
                                        childAspectRatio: 16 / 9,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                      ),
                                      itemCount: participants,
                                      itemBuilder: (context, index) =>
                                          VideoWidget(
                                        participant: state.participants[index],
                                      ),
                                    );
                                  }

                                  // Custom layouts for 1-4 participants
                                  return Column(
                                    children: [
                                      if (participants >= 1)
                                        Expanded(
                                          flex: 2,
                                          child: VideoWidget(
                                            participant: state.participants[0],
                                          ),
                                        ),
                                      if (participants > 1)
                                        const SizedBox(height: 8),
                                      if (participants > 1)
                                        Expanded(
                                          flex: participants > 2 ? 1 : 2,
                                          child: Row(
                                            children: [
                                              for (var i = 1;
                                                  i < participants;
                                                  i++) ...[
                                                if (i > 1)
                                                  const SizedBox(width: 8),
                                                Expanded(
                                                  child: VideoWidget(
                                                    participant:
                                                        state.participants[i],
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            if (!participantsEmpty)
                              _LiveStreamOverlay(
                                showOverlay: showOverlay,
                                isMobile: isMobile,
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key, required this.participant});

  final Participant participant;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<LiveStreamCubit, LiveStreamState>(
        buildWhen: (previous, current) =>
            previous.showOverlay != current.showOverlay ||
            previous.microphoneEnabled != current.microphoneEnabled,
        builder: (context, state) {
          return VideoView(participant, state);
        },
      ),
    );
  }
}

class VideoView extends StatefulWidget {
  final Participant participant;
  final LiveStreamState liveStreamState;

  const VideoView(this.participant, this.liveStreamState, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _VideoViewState();
  }
}

class _VideoViewState extends State<VideoView> {
  TrackPublication? videoPub;

  @override
  void initState() {
    super.initState();
    widget.participant.addListener(_onParticipantChanged);
    // trigger initial change
    _onParticipantChanged();
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoView oldWidget) {
    oldWidget.participant.removeListener(_onParticipantChanged);
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
    super.didUpdateWidget(oldWidget);
  }

  void _onParticipantChanged() {
    var subscribedVideos =
        widget.participant.videoTrackPublications.where((pub) {
      return pub.kind == TrackType.VIDEO && pub.subscribed;
    });

    setState(() {
      if (subscribedVideos.isNotEmpty) {
        var videoPub = subscribedVideos.first;

        if (widget.participant is RemoteParticipant) {
          if (videoPub.muted && !videoPub.isScreenShare) {
            this.videoPub = null; //amazing
            return;
          }
          this.videoPub = videoPub;
          return;
        }

        final screenShareEnabled =
            locator<LiveStreamCubit>().state.screenShareEnabled;
        if (screenShareEnabled) {
          videoPub = subscribedVideos
              .firstWhere((pub) => pub.source == TrackSource.screenShareVideo);
        } else {
          videoPub = subscribedVideos
              .firstWhere((pub) => pub.source == TrackSource.camera); //amazing
        }

        //for screen share & non muted tracks (tracks with no mic)
        if (videoPub.isScreenShare || !videoPub.muted) {
          this.videoPub = videoPub;
          return;
        }
      }
      videoPub = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var videoPub = this.videoPub;

    return Stack(
      children: [
        if (videoPub != null)
          VideoTrackRenderer(
            videoPub.track as VideoTrack,
            fit: rtc.RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          )
        else
          Container(
            color: ColorPalette.divider,
            child: Center(
              child: CircleAvatar(
                backgroundColor: ColorPalette.primary,
                child: Text(
                  widget.participant.attributes['username']
                          ?.substring(0, 1)
                          .toUpperCase() ??
                      '',
                ),
              ),
            ),
          ),
        Positioned.fill(
          bottom: 8,
          left: 8,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: ColorPalette.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.liveStreamState.microphoneEnabled
                          ? Icons.mic
                          : Icons.mic_off,
                      color: ColorPalette.white,
                    ),
                    if (widget.liveStreamState.showOverlay) ...[
                      SizedBox(width: 8),
                      Text(
                        widget.participant.attributes['username'] ?? '',
                        style: TextStyle(
                          color: ColorPalette.white,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LiveStreamOverlay extends StatelessWidget {
  const _LiveStreamOverlay({required this.showOverlay, required this.isMobile});

  final bool showOverlay;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      bottom: showOverlay ? 0 : -10,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: showOverlay ? 1.0 : 0.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.black,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LiveStreamCubit, LiveStreamState>(
              buildWhen: (previous, current) =>
                  previous.connectedToChannel != current.connectedToChannel,
              builder: (context, state) {
                if (!state.connectedToChannel) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 48,
                        width: 120,
                        child: DiscordIconButton.filled(
                          backgroundColor: ColorPalette.primary,
                          tooltip: 'Join Stream',
                          onPressed: () {
                            // Get the current channel ID from the parent widget
                            final channelId = context
                                .read<ChannelCubit>()
                                .state
                                .selectedChannel
                                .id;
                            if (channelId != null) {
                              locator<LiveStreamCubit>().joinRoom(
                                context.read<UserCubit>().state.user.id ?? 0,
                                channelId,
                              );
                            }
                          },
                          icon: Text(
                            'Join',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorPalette.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            BlocBuilder<LiveStreamCubit, LiveStreamState>(
                              buildWhen: (previous, current) =>
                                  previous.microphoneEnabled !=
                                  current.microphoneEnabled,
                              builder: (context, state) {
                                return DiscordIconButton(
                                  tooltip: state.microphoneEnabled
                                      ? 'Turn Off Microphone'
                                      : 'Turn On Microphone',
                                  onPressed: () {
                                    locator<LiveStreamCubit>()
                                        .toggleMicrophone();
                                  },
                                  icon: Icon(
                                    state.microphoneEnabled
                                        ? Icons.mic
                                        : Icons.mic_off,
                                    size: 24,
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 16),
                            BlocBuilder<LiveStreamCubit, LiveStreamState>(
                              buildWhen: (previous, current) =>
                                  previous.cameraEnabled !=
                                  current.cameraEnabled,
                              builder: (context, state) {
                                return DiscordIconButton(
                                  tooltip: state.cameraEnabled
                                      ? 'Turn Off Camera'
                                      : 'Turn On Camera',
                                  onPressed: () {
                                    locator<LiveStreamCubit>().toggleCamera();
                                  },
                                  icon: Icon(
                                    state.cameraEnabled
                                        ? Icons.videocam
                                        : Icons.videocam_off,
                                    size: 24,
                                  ),
                                );
                              },
                            ),
                            if (!isMobile) SizedBox(width: 16),
                            if (!isMobile)
                              BlocBuilder<LiveStreamCubit, LiveStreamState>(
                                buildWhen: (previous, current) =>
                                    previous.screenShareEnabled !=
                                    current.screenShareEnabled,
                                builder: (context, state) {
                                  return DiscordIconButton(
                                    tooltip: state.screenShareEnabled
                                        ? 'Turn Off Screen Share'
                                        : 'Turn On Screen Share',
                                    onPressed: () {
                                      locator<LiveStreamCubit>()
                                          .toggleScreenShare();
                                    },
                                    icon: Icon(
                                      state.screenShareEnabled
                                          ? Icons.screen_share
                                          : Icons.stop_screen_share,
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: kToolbarHeight * 2),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: DiscordIconButton.filled(
                        backgroundColor: ColorPalette.error,
                        tooltip: 'Disconnect',
                        onPressed: () {
                          locator<LiveStreamCubit>().disconnect();
                          if (isMobile) {
                            context.router.maybePop();
                          }
                        },
                        icon: Icon(
                          Icons.call_end,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
