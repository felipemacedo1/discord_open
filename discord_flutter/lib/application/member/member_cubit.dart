import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/infrastructure/member/member_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_cubit.freezed.dart';
part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit({required this.repo}) : super(MemberState.initial());

  final MemberRepository repo;

  void fetchMembers({required int serverId}) async {
    emit(state.copyWith(isLoading: true, members: []));
    final members = await repo.getMembers(serverId: serverId);
    emit(state.copyWith(isLoading: false, members: members));
  }

  void addMemberToServer({required int serverId, required int userId}) async {
    await repo.addMemberToServer(serverId: serverId, userId: userId);
  }

  void resetToInitial() {
    emit(MemberState.initial());
  }
}
