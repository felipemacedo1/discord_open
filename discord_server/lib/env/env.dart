import 'package:envied/envied.dart';

part 'env.g.dart';

/// Environment configuration using envied package
/// This file reads from .env and provides type-safe access to environment variables
@Envied(path: '.env')
abstract class Env {
  // LiveKit Configuration
  @EnviedField(varName: 'LIVEKIT_API_KEY')
  static const String liveKitApiKey = _Env.liveKitApiKey;

  @EnviedField(varName: 'LIVEKIT_API_SECRET', obfuscate: true)
  static const String liveKitApiSecret = _Env.liveKitApiSecret;

  @EnviedField(varName: 'LIVEKIT_URL')
  static const String liveKitUrl = _Env.liveKitUrl;

  // Database Configuration
  @EnviedField(varName: 'DATABASE_HOST', defaultValue: 'localhost')
  static const String databaseHost = _Env.databaseHost;

  @EnviedField(varName: 'DATABASE_PORT', defaultValue: '8090')
  static const String databasePort = _Env.databasePort;

  @EnviedField(varName: 'DATABASE_NAME', defaultValue: 'discord')
  static const String databaseName = _Env.databaseName;

  @EnviedField(varName: 'DATABASE_USER', defaultValue: 'postgres')
  static const String databaseUser = _Env.databaseUser;

  @EnviedField(varName: 'DATABASE_PASSWORD', obfuscate: true)
  static const String databasePassword = _Env.databasePassword;

  // Redis Configuration
  @EnviedField(varName: 'REDIS_ENABLED', defaultValue: 'false')
  static const String redisEnabled = _Env.redisEnabled;

  @EnviedField(varName: 'REDIS_HOST', defaultValue: 'localhost')
  static const String redisHost = _Env.redisHost;

  @EnviedField(varName: 'REDIS_PORT', defaultValue: '8091')
  static const String redisPort = _Env.redisPort;

  @EnviedField(varName: 'REDIS_PASSWORD', obfuscate: true, defaultValue: '')
  static const String redisPassword = _Env.redisPassword;

  // Server Configuration
  @EnviedField(varName: 'SERVER_HOST', defaultValue: 'localhost')
  static const String serverHost = _Env.serverHost;

  @EnviedField(varName: 'SERVER_PORT', defaultValue: '8080')
  static const String serverPort = _Env.serverPort;

  @EnviedField(varName: 'SERVER_PUBLIC_SCHEME', defaultValue: 'http')
  static const String serverPublicScheme = _Env.serverPublicScheme;

  // Environment
  @EnviedField(varName: 'ENVIRONMENT', defaultValue: 'development')
  static const String environment = _Env.environment;

  // Helper methods
  static bool get isProduction => environment == 'production';
  static bool get isDevelopment => environment == 'development';
  static bool get isRedisEnabled => redisEnabled.toLowerCase() == 'true';
  static int get databasePortInt => int.parse(databasePort);
  static int get redisPortInt => int.parse(redisPort);
  static int get serverPortInt => int.parse(serverPort);
}
