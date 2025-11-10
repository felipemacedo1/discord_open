part of 'user_cubit.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState({
    required DiscordUser user,
    required bool isLoading,
  }) = _UserState;
  factory UserState.initial() => UserState(
        user: DiscordUser(
          status: ActivityStatus.online,
          members: <ServerMembership>[],
          userInfoId: -1,
        ),
        isLoading: false,
      );
}
