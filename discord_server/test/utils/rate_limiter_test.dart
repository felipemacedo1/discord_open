import 'package:discord_server/src/utils/rate_limiter.dart';
import 'package:test/test.dart';

void main() {
  group('RateLimiter', () {
    test('allows requests within limit', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 5,
        window: Duration(seconds: 10),
      );

      // Act & Assert
      for (int i = 0; i < 5; i++) {
        expect(limiter.isAllowed('user1'), isTrue,
            reason: 'Request $i should be allowed');
      }
    });

    test('blocks requests exceeding limit', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 3,
        window: Duration(seconds: 10),
      );

      // Act
      limiter.isAllowed('user2'); // 1st request
      limiter.isAllowed('user2'); // 2nd request
      limiter.isAllowed('user2'); // 3rd request

      // Assert
      expect(limiter.isAllowed('user2'), isFalse,
          reason: '4th request should be blocked');
      expect(limiter.isAllowed('user2'), isFalse,
          reason: '5th request should still be blocked');
    });

    test('tracks different identifiers separately', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 2,
        window: Duration(seconds: 10),
      );

      // Act & Assert
      expect(limiter.isAllowed('user1'), isTrue);
      expect(limiter.isAllowed('user1'), isTrue);
      expect(limiter.isAllowed('user1'), isFalse);

      // User2 should have their own limit
      expect(limiter.isAllowed('user2'), isTrue);
      expect(limiter.isAllowed('user2'), isTrue);
      expect(limiter.isAllowed('user2'), isFalse);
    });

    test('getRequestCount returns correct count', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 5,
        window: Duration(seconds: 10),
      );

      // Act
      limiter.isAllowed('user3');
      limiter.isAllowed('user3');
      limiter.isAllowed('user3');

      // Assert
      expect(limiter.getRequestCount('user3'), equals(3));
    });

    test('getRemainingRequests returns correct remaining count', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 5,
        window: Duration(seconds: 10),
      );

      // Act & Assert
      expect(limiter.getRemainingRequests('user4'), equals(5));

      limiter.isAllowed('user4');
      expect(limiter.getRemainingRequests('user4'), equals(4));

      limiter.isAllowed('user4');
      limiter.isAllowed('user4');
      expect(limiter.getRemainingRequests('user4'), equals(2));

      limiter.isAllowed('user4');
      limiter.isAllowed('user4');
      expect(limiter.getRemainingRequests('user4'), equals(0));

      // Try to exceed
      limiter.isAllowed('user4');
      expect(limiter.getRemainingRequests('user4'), equals(0));
    });

    test('reset clears limits for specific identifier', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 2,
        window: Duration(seconds: 10),
      );

      // Act
      limiter.isAllowed('user5');
      limiter.isAllowed('user5');
      expect(limiter.isAllowed('user5'), isFalse);

      limiter.reset('user5');

      // Assert
      expect(limiter.isAllowed('user5'), isTrue,
          reason: 'After reset, requests should be allowed again');
    });

    test('clearAll clears all rate limits', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 1,
        window: Duration(seconds: 10),
      );

      // Act
      limiter.isAllowed('user6');
      limiter.isAllowed('user7');

      expect(limiter.isAllowed('user6'), isFalse);
      expect(limiter.isAllowed('user7'), isFalse);

      limiter.clearAll();

      // Assert
      expect(limiter.isAllowed('user6'), isTrue);
      expect(limiter.isAllowed('user7'), isTrue);
    });

    test('cleanup removes old requests from bucket', () async {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 2,
        window: Duration(milliseconds: 100),
      );

      // Act
      limiter.isAllowed('user8');
      limiter.isAllowed('user8');
      expect(limiter.isAllowed('user8'), isFalse);

      // Wait for window to pass
      await Future.delayed(Duration(milliseconds: 150));

      // Assert
      expect(limiter.isAllowed('user8'), isTrue,
          reason: 'After window expires, requests should be allowed again');
    });

    test('cleanup removes empty buckets', () {
      // Arrange
      final limiter = RateLimiter(
        maxRequests: 5,
        window: Duration(milliseconds: 50),
      );

      // Act
      limiter.isAllowed('user9');
      expect(limiter.getRequestCount('user9'), equals(1));

      // Wait and cleanup
      Future.delayed(Duration(milliseconds: 100), () {
        limiter.cleanup();
        expect(limiter.getRequestCount('user9'), equals(0));
      });
    });
  });

  group('RateLimitExceededException', () {
    test('has correct properties', () {
      // Arrange & Act
      final exception = RateLimitExceededException(
        message: 'Rate limit hit',
        retryAfterSeconds: 60,
      );

      // Assert
      expect(exception.status, equals(429));
      expect(exception.message, equals('Rate limit hit'));
      expect(exception.retryAfterSeconds, equals(60));
      expect(exception.toString(), contains('RateLimitExceededException'));
      expect(exception.toString(), contains('Rate limit hit'));
      expect(exception.toString(), contains('60'));
    });

    test('has default message', () {
      // Arrange & Act
      final exception = RateLimitExceededException(retryAfterSeconds: 30);

      // Assert
      expect(exception.message, equals('Too many requests'));
      expect(exception.retryAfterSeconds, equals(30));
    });
  });

  group('RateLimiters', () {
    setUp(() {
      // Clear all limiters before each test
      RateLimiters.messages.clearAll();
      RateLimiters.auth.clearAll();
      RateLimiters.api.clearAll();
      RateLimiters.channelCreation.clearAll();
      RateLimiters.serverCreation.clearAll();
    });

    test('messages limiter has correct configuration', () {
      // Act - make 5 requests (limit is 5 per 10 seconds)
      for (int i = 0; i < 5; i++) {
        expect(RateLimiters.messages.isAllowed('test_user'), isTrue);
      }

      // Assert - 6th request should be blocked
      expect(RateLimiters.messages.isAllowed('test_user'), isFalse);
    });

    test('auth limiter has correct configuration', () {
      // Act - make 5 requests (limit is 5 per minute)
      for (int i = 0; i < 5; i++) {
        expect(RateLimiters.auth.isAllowed('test_user'), isTrue);
      }

      // Assert - 6th request should be blocked
      expect(RateLimiters.auth.isAllowed('test_user'), isFalse);
    });

    test('api limiter has correct configuration', () {
      // Act - make 100 requests (limit is 100 per minute)
      for (int i = 0; i < 100; i++) {
        expect(RateLimiters.api.isAllowed('test_user'), isTrue);
      }

      // Assert - 101st request should be blocked
      expect(RateLimiters.api.isAllowed('test_user'), isFalse);
    });

    test('channelCreation limiter has correct configuration', () {
      // Act - make 5 requests (limit is 5 per hour)
      for (int i = 0; i < 5; i++) {
        expect(RateLimiters.channelCreation.isAllowed('test_user'), isTrue);
      }

      // Assert - 6th request should be blocked
      expect(RateLimiters.channelCreation.isAllowed('test_user'), isFalse);
    });

    test('serverCreation limiter has correct configuration', () {
      // Act - make 2 requests (limit is 2 per day)
      expect(RateLimiters.serverCreation.isAllowed('test_user'), isTrue);
      expect(RateLimiters.serverCreation.isAllowed('test_user'), isTrue);

      // Assert - 3rd request should be blocked
      expect(RateLimiters.serverCreation.isAllowed('test_user'), isFalse);
    });

    test('cleanupAll cleans all rate limiters', () {
      // Act
      RateLimiters.messages.isAllowed('user1');
      RateLimiters.auth.isAllowed('user2');
      RateLimiters.api.isAllowed('user3');

      RateLimiters.cleanupAll();

      // Assert - Just verify it doesn't throw
      expect(() => RateLimiters.cleanupAll(), returnsNormally);
    });
  });
}
