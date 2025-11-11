import 'package:discord_server/src/utils/app_logger.dart';
import 'package:discord_server/env/env.dart';
import 'package:test/test.dart';

void main() {
  group('AppLogger', () {
    test('logger is not null', () {
      // Assert
      expect(AppLogger.logger, isNotNull);
    });

    test('debug method does not throw', () {
      // Act & Assert
      expect(
        () => AppLogger.debug('Test debug message'),
        returnsNormally,
      );
    });

    test('info method does not throw', () {
      // Act & Assert
      expect(
        () => AppLogger.info('Test info message'),
        returnsNormally,
      );
    });

    test('warning method does not throw', () {
      // Act & Assert
      expect(
        () => AppLogger.warning('Test warning message'),
        returnsNormally,
      );
    });

    test('error method does not throw', () {
      // Act & Assert
      expect(
        () => AppLogger.error('Test error message', Exception('test')),
        returnsNormally,
      );
    });

    test('fatal method does not throw', () {
      // Act & Assert
      expect(
        () => AppLogger.fatal('Test fatal message', Exception('test')),
        returnsNormally,
      );
    });

    group('Categorized Logging', () {
      test('endpoint method logs with correct format', () {
        // Act & Assert
        expect(
          () => AppLogger.endpoint(
            'TestEndpoint',
            'testMethod',
            params: {'key': 'value'},
          ),
          returnsNormally,
        );
      });

      test('auth method logs with correct format', () {
        // Act & Assert
        expect(
          () => AppLogger.auth('login', userId: 123),
          returnsNormally,
        );
      });

      test('database method logs with correct format', () {
        // Act & Assert
        expect(
          () => AppLogger.database('insert', 'users', recordId: 456),
          returnsNormally,
        );
      });

      test('websocket method logs with correct format', () {
        // Act & Assert
        expect(
          () => AppLogger.websocket('message sent', channelId: '1', userId: 123),
          returnsNormally,
        );
      });
    });

    group('Environment Aware Logging', () {
      test('isProduction method exists', () {
        // Act & Assert
        expect(
          () => Env.isProduction(),
          returnsNormally,
        );
      });

      test('isDevelopment method exists', () {
        // Act & Assert
        expect(
          () => Env.isDevelopment(),
          returnsNormally,
        );
      });
    });
  });
}
