import 'dart:collection';
import 'package:discord_server/src/utils/app_logger.dart';

/// Simple in-memory rate limiter using token bucket algorithm
/// For production, consider using Redis-based rate limiting for distributed systems
class RateLimiter {
  final Map<String, _RateLimitBucket> _buckets = HashMap();
  final int maxRequests;
  final Duration window;
  
  /// Create a rate limiter
  /// [maxRequests] - Maximum number of requests allowed
  /// [window] - Time window for rate limiting
  RateLimiter({
    required this.maxRequests,
    required this.window,
  });

  /// Check if request is allowed for the given identifier
  /// Returns true if request should be allowed, false if rate limit exceeded
  bool isAllowed(String identifier) {
    final now = DateTime.now();
    
    // Get or create bucket for this identifier
    final bucket = _buckets.putIfAbsent(
      identifier,
      () => _RateLimitBucket(maxRequests, window),
    );

    // Clean up old requests
    bucket.cleanup(now);

    // Check if we're at the limit
    if (bucket.requestCount >= maxRequests) {
      AppLogger.warning('Rate limit exceeded for $identifier');
      return false;
    }

    // Add this request
    bucket.addRequest(now);
    return true;
  }

  /// Get current request count for identifier
  int getRequestCount(String identifier) {
    final bucket = _buckets[identifier];
    if (bucket == null) return 0;
    
    bucket.cleanup(DateTime.now());
    return bucket.requestCount;
  }

  /// Get remaining requests for identifier
  int getRemainingRequests(String identifier) {
    final count = getRequestCount(identifier);
    return (maxRequests - count).clamp(0, maxRequests);
  }

  /// Reset rate limit for identifier (admin use)
  void reset(String identifier) {
    _buckets.remove(identifier);
    AppLogger.info('Rate limit reset for $identifier');
  }

  /// Clear all rate limits
  void clearAll() {
    _buckets.clear();
    AppLogger.info('All rate limits cleared');
  }

  /// Cleanup old buckets periodically to prevent memory leak
  void cleanup() {
    final now = DateTime.now();
    _buckets.removeWhere((key, bucket) {
      bucket.cleanup(now);
      return bucket.requestCount == 0;
    });
  }
}

/// Internal bucket for tracking requests
class _RateLimitBucket {
  final List<DateTime> _requests = [];
  final int maxRequests;
  final Duration window;

  _RateLimitBucket(this.maxRequests, this.window);

  int get requestCount => _requests.length;

  void addRequest(DateTime time) {
    _requests.add(time);
  }

  void cleanup(DateTime now) {
    final cutoff = now.subtract(window);
    _requests.removeWhere((time) => time.isBefore(cutoff));
  }
}

/// Exception thrown when rate limit is exceeded
class RateLimitExceededException implements Exception {
  final String message;
  final int status = 429;
  final int retryAfterSeconds;

  RateLimitExceededException({
    this.message = 'Too many requests',
    required this.retryAfterSeconds,
  });

  @override
  String toString() => 'RateLimitExceededException: $message (retry after $retryAfterSeconds seconds)';
}

/// Global rate limiters for different operations
class RateLimiters {
  // Message sending: 5 messages per 10 seconds
  static final messages = RateLimiter(
    maxRequests: 5,
    window: Duration(seconds: 10),
  );

  // Authentication attempts: 5 attempts per minute
  static final auth = RateLimiter(
    maxRequests: 5,
    window: Duration(minutes: 1),
  );

  // API calls: 100 requests per minute
  static final api = RateLimiter(
    maxRequests: 100,
    window: Duration(minutes: 1),
  );

  // Channel creation: 5 channels per hour
  static final channelCreation = RateLimiter(
    maxRequests: 5,
    window: Duration(hours: 1),
  );

  // Server creation: 2 servers per day
  static final serverCreation = RateLimiter(
    maxRequests: 2,
    window: Duration(hours: 24),
  );

  /// Cleanup all rate limiters (call periodically)
  static void cleanupAll() {
    messages.cleanup();
    auth.cleanup();
    api.cleanup();
    channelCreation.cleanup();
    serverCreation.cleanup();
  }
}
