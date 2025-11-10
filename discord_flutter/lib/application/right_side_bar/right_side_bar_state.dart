part of 'right_side_bar_cubit.dart';

enum RightSideBarType {
  members,
  pinnedMessages,
  search,
  none,
}

@freezed
abstract class RightSideBarState with _$RightSideBarState {
  factory RightSideBarState({
    required bool isDrawerOpen,
    required RightSideBarType selectedRightSideBarType,
  }) = _RightSideBarState;

  factory RightSideBarState.initial() => RightSideBarState(
        isDrawerOpen: false,
        selectedRightSideBarType: RightSideBarType.none,
      );
}
