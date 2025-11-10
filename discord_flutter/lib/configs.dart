//Please never push to version control

import 'package:universal_io/io.dart';

/// Application Configuration
/// TODO: Move to environment variables for production
class Configs {
  // Backend server URL
  // For Android emulator: use 10.0.2.2 instead of localhost
  // For iOS simulator: use localhost
  // For physical devices: use your machine's IP address
  final host = Platform.isAndroid 
      ? const String.fromEnvironment('SERVER_URL', defaultValue: 'http://10.0.2.2:8080/')
      : const String.fromEnvironment('SERVER_URL', defaultValue: 'http://localhost:8080/');

  // LiveKit server URL for WebRTC
  // Leave empty if not configured yet
  final liveKitUrl = const String.fromEnvironment('LIVEKIT_URL', defaultValue: '');
}
