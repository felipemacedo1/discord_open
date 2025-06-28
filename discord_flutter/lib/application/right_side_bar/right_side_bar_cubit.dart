import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'right_side_bar_cubit.freezed.dart';
part 'right_side_bar_state.dart';

class RightSideBarCubit extends Cubit<RightSideBarState> {
  RightSideBarCubit() : super(RightSideBarState.initial());

  void toggleSideBar() {
    emit(
      state.copyWith(
        isDrawerOpen: !state.isDrawerOpen,
      ),
    );
  }

  void setSideBarType(RightSideBarType type) {
    final isDrawerOpen = state.isDrawerOpen;
    if (!isDrawerOpen) {
      toggleSideBar();
    }

    emit(
      state.copyWith(
        selectedRightSideBarType: type,
      ),
    );
  }
}
