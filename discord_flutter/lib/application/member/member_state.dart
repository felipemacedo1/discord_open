part of 'member_cubit.dart';

@freezed
abstract class MemberState with _$MemberState {
  factory MemberState({
    required bool isLoading,
    required List<DiscordUser> members,
  }) = _MemberState;

  factory MemberState.initial() => MemberState(
        isLoading: false,
        members: <DiscordUser>[],
      );
}
