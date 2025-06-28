import 'package:serverpod/serverpod.dart';

class Configs {
  static final liveKitApiSecret = '';
  static final liveKitApiKey = '';
  static final serverpodConfig = ServerpodConfig(
    apiServer: ServerConfig(
      port: 8080,
      publicScheme: 'https',
      // publicHost: 'discordflutter-production.up.railway.app',
      publicHost: 'api.examplepod.com',
      publicPort: 443,
    ),
    database: DatabaseConfig(
      host: 'localhost',
      port: 5432,
      user: 'postgres',
      password: '123456',
      name: 'railway',
    ),
    webServer: ServerConfig(
      port: 8082,
      publicScheme: 'https',
      publicHost: 'app.examplepod.com',
      publicPort: 443,
    ),
  );
}
