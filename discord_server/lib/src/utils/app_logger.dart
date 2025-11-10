import 'package:discord_server/env/env.dart';
import 'package:logger/logger.dart';

/// Application-wide logging utility
/// Provides structured logging with different levels
class AppLogger {
  static Logger? _instance;

  /// Get the logger instance
  static Logger get instance {
    _instance ??= _createLogger();
    return _instance!;
  }

  /// Create logger with appropriate configuration
  static Logger _createLogger() {
    final level = _getLogLevel();
    
    return Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if error
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true, // Print timestamp
      ),
      level: level,
    );
  }

  /// Get log level from environment
  static Level _getLogLevel() {
    if (Env.isProduction) {
      return Level.warning; // Only warnings and errors in production
    }
    return Level.debug; // Verbose logging in development
  }

  // Convenience methods
  
  /// Log debug message
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log info message
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log warning message
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log error message
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log fatal error
  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log endpoint call
  static void endpoint(String endpointName, String method, {Map<String, dynamic>? params}) {
    final paramsStr = params != null ? ' params=$params' : '';
    info('📡 Endpoint: $endpointName.$method$paramsStr');
  }

  /// Log authentication event
  static void auth(String event, {int? userId, String? email}) {
    final userInfo = userId != null ? ' userId=$userId' : email != null ? ' email=$email' : '';
    info('🔐 Auth: $event$userInfo');
  }

  /// Log database operation
  static void database(String operation, String table, {int? id}) {
    final idStr = id != null ? ' id=$id' : '';
    debug('🗄️  DB: $operation on $table$idStr');
  }

  /// Log WebSocket event
  static void websocket(String event, {String? channelId, int? userId}) {
    final context = channelId != null ? ' channel=$channelId' : userId != null ? ' user=$userId' : '';
    debug('🔌 WS: $event$context');
  }
}
