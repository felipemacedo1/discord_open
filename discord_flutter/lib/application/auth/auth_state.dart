part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    required bool isLoggedIn,
    required int userId,
  }) = _AuthState;
  factory AuthState.initial() => AuthState(
        isLoggedIn: false,
        userId: -1,
      );
}
