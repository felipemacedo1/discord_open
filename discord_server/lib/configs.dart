import 'package:discord_server/env/env.dart';
import 'package:serverpod/serverpod.dart';

/// Application configuration using environment variables
/// Never hardcode sensitive values here!
class Configs {
  // LiveKit Configuration
  static String get liveKitApiSecret => Env.liveKitApiSecret;
  static String get liveKitApiKey => Env.liveKitApiKey;
  static String get liveKitUrl => Env.liveKitUrl;

  // Serverpod Configuration
  static ServerpodConfig get serverpodConfig {
    final port = Env.serverPortInt;
    final host = Env.serverHost;
    final scheme = Env.serverPublicScheme;

    return ServerpodConfig(
      apiServer: ServerConfig(
        port: port,
        publicScheme: scheme,
        publicHost: host,
        publicPort: port,
      ),
      database: DatabaseConfig(
        host: Env.databaseHost,
        port: Env.databasePortInt,
        user: Env.databaseUser,
        password: Env.databasePassword,
        name: Env.databaseName,
      ),
      webServer: ServerConfig(
        port: port + 2, // webServer typically runs on apiServer port + 2
        publicScheme: scheme,
        publicHost: host,
        publicPort: port + 2,
      ),
      redis: Env.isRedisEnabled
          ? RedisConfig(
              enabled: true,
              host: Env.redisHost,
              port: Env.redisPortInt,
            )
          : null,
    );
  }
}
