import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/infrastructure/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.repo,
  }) : super(UserState.initial());

  final UserRepository repo;

  void getUser(int userId) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Durations.extralong4 * 2);
    final user = await repo.getUser(userId);
    emit(state.copyWith(user: user, isLoading: false));
  }

  void updateStatus(ActivityStatus status) async {
    final userId = state.user.id;
    if (userId == null) return;

    emit(state.copyWith(isLoading: true));
    await repo.updateStatus(userId, status);
    emit(
      state.copyWith(
        isLoading: false,
        user: state.user.copyWith(
          status: status,
        ),
      ),
    );
  }

  void resetToInitial() {
    emit(UserState.initial());
  }
}
