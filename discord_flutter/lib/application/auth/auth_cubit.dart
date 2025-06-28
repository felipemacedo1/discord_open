import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.sessionManager,
  }) : super(AuthState.initial());

  final SessionManager sessionManager;

  void checkAuth() {
    if (sessionManager.isSignedIn) {
      final userId = sessionManager.signedInUser?.id;
      if (userId != null) {
        emit(state.copyWith(isLoggedIn: true, userId: userId));
      } else {
        emit(state.copyWith(isLoggedIn: true));
      }
    } else {
      emit(state.copyWith(isLoggedIn: false));
    }
  }

  void signOut() async {
    final result = await sessionManager.signOutDevice();
    if (result) {
      emit(AuthState.initial().copyWith(isLoggedIn: false));
    }
  }
}
