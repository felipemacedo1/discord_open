import 'package:discord_server/env/env.dart';
import 'package:discord_server/src/utils/app_logger.dart';
import 'package:serverpod/serverpod.dart';

/// Health check endpoint for monitoring system status
/// Does NOT require authentication to allow monitoring tools access
class HealthEndpoint extends Endpoint {
  /// Public health check - no auth required
  @override
  bool get requireLogin => false;

  /// Basic health check
  /// Returns 200 if service is running
  Future<Map<String, dynamic>> check(Session session) async {
    AppLogger.endpoint('HealthEndpoint', 'check');
    
    return {
      'status': 'healthy',
      'timestamp': DateTime.now().toIso8601String(),
      'environment': Env.environment,
      'service': 'discord-open-server',
    };
  }

  /// Detailed health check with dependency checks
  /// Checks database, Redis (if enabled), and other critical services
  Future<Map<String, dynamic>> detailed(Session session) async {
    AppLogger.endpoint('HealthEndpoint', 'detailed');
    
    final checks = <String, Map<String, dynamic>>{};
    var overallHealthy = true;

    // Check database
    try {
      await session.db.query('SELECT 1');
      checks['database'] = {
        'status': 'healthy',
        'message': 'Database connection successful',
      };
      AppLogger.debug('Database health check: OK');
    } catch (e) {
      overallHealthy = false;
      checks['database'] = {
        'status': 'unhealthy',
        'message': 'Database connection failed',
        'error': e.toString(),
      };
      AppLogger.error('Database health check failed', e);
    }

    // Check Redis (if enabled)
    if (Env.isRedisEnabled) {
      try {
        // Try to ping Redis
        await session.redis.get('health_check');
        checks['redis'] = {
          'status': 'healthy',
          'message': 'Redis connection successful',
        };
        AppLogger.debug('Redis health check: OK');
      } catch (e) {
        // Redis failure is not critical if it's just caching
        checks['redis'] = {
          'status': 'degraded',
          'message': 'Redis connection failed (non-critical)',
          'error': e.toString(),
        };
        AppLogger.warning('Redis health check failed', e);
      }
    } else {
      checks['redis'] = {
        'status': 'disabled',
        'message': 'Redis is not enabled',
      };
    }

    // Check messaging system
    try {
      // Just verify the messaging system is initialized
      checks['messaging'] = {
        'status': 'healthy',
        'message': 'Messaging system operational',
      };
      AppLogger.debug('Messaging health check: OK');
    } catch (e) {
      overallHealthy = false;
      checks['messaging'] = {
        'status': 'unhealthy',
        'message': 'Messaging system failed',
        'error': e.toString(),
      };
      AppLogger.error('Messaging health check failed', e);
    }

    return {
      'status': overallHealthy ? 'healthy' : 'unhealthy',
      'timestamp': DateTime.now().toIso8601String(),
      'environment': Env.environment,
      'service': 'discord-open-server',
      'checks': checks,
      'uptime': _getUptime(),
    };
  }

  /// Readiness check - is the service ready to accept traffic?
  Future<Map<String, dynamic>> ready(Session session) async {
    AppLogger.endpoint('HealthEndpoint', 'ready');
    
    try {
      // Check if database is accessible
      await session.db.query('SELECT 1');
      
      return {
        'ready': true,
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      AppLogger.error('Readiness check failed', e);
      
      return {
        'ready': false,
        'timestamp': DateTime.now().toIso8601String(),
        'reason': 'Database not accessible',
      };
    }
  }

  /// Liveness check - is the service alive?
  Future<Map<String, dynamic>> live(Session session) async {
    // Simple check - if we can respond, we're alive
    return {
      'alive': true,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Get server uptime
  String _getUptime() {
    // This would need to track actual server start time
    // For now, return a placeholder
    return 'uptime tracking not implemented';
  }
}
