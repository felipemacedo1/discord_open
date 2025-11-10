import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:flutter/widgets.dart';

extension ActivityStatusExtension on ActivityStatus {
  Color get getStatusColor => _getStatusColor(this);

  Color _getStatusColor(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.online:
        return ColorPalette.statusOnline;
      case ActivityStatus.idle:
        return ColorPalette.statusIdle;
      case ActivityStatus.dnd:
        return ColorPalette.statusDnd;
      case ActivityStatus.invisible:
        return ColorPalette.statusInvisible;
    }
  }
}
