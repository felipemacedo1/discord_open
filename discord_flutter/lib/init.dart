import 'package:desktop_window/desktop_window.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:universal_io/io.dart';

Future<void> setMinWindowSize() async {
  if ((Platform.isWindows || Platform.isLinux || Platform.isMacOS) && !kIsWeb) {
    await DesktopWindow.setMinWindowSize(
      Size(950, 500),
    );
  }
}

void initClient() {
  final client = locator<Client>();
  client.connectivityMonitor = FlutterConnectivityMonitor();
}

Future<void> initSessionManager() async {
  final sessionManager = locator<SessionManager>();
  await sessionManager.initialize();
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  //window
  await setMinWindowSize();

  //serverpod
  initClient();
  initSessionManager();
}
