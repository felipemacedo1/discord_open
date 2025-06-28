import 'dart:ui';

class ColorPalette {
  static final primary = Color.fromRGBO(28, 28, 31, 1);
  static final primaryVariantOne = Color.fromRGBO(39, 40, 43, 1);
  static final primaryVariantTwo = Color.fromRGBO(49, 51, 56, 1);
  static final divider = Color.fromRGBO(44, 45, 49, 1);
  static final whiteWithOpacity = Color.fromRGBO(255, 255, 255, 0.15);
  static final groupIconColor = Color.fromRGBO(255, 255, 255, 0.5);
  static final selectedChannelIcon = Color.fromRGBO(255, 255, 255, 1);
  static final unselectedChannelIcon = Color.fromRGBO(255, 255, 255, 0.6);
  static final chatInputBackground = Color.fromRGBO(255, 255, 255, 0.05);
  static final chatDateHeader = Color.fromRGBO(255, 255, 255, 0.08);
  static final error = Color(0xffef5350);
  static final warning = Color(0xffff9800);
  static final success = Color(0xff4caf50);
  static final serverItemLeading = Color.fromRGBO(181, 191, 231, 1);
  static final white = Color(0xffffffff);

  // Search colors
  static final searchHighlight = Color.fromRGBO(255, 209, 92, 0.31);

  // Status colors
  static final statusOnline = Color(0xff4caf50); // Green
  static final statusIdle = Color(0xffff9800); // Orange
  static final statusDnd = Color(0xffef5350); // Red
  static final statusInvisible =
      Color.fromRGBO(255, 255, 255, 0.15); // Transparent

  static final selectedServer = Color(0xff5865F2);
  static final moreServersAppBar = Color.fromRGBO(43, 45, 49, 1);
  static final moreServersTextField = Color.fromRGBO(0, 0, 0, 0.24);
}
