import 'package:serverpod/serverpod.dart';

/// Authentication helper for validating user permissions
/// Provides utilities for checking authentication and ownership
class AuthHelper {
  /// Get the authenticated user ID from the session
  /// Returns null if user is not authenticated
  static Future<int?> getAuthenticatedUserId(Session session) async {
    final authenticated = await session.authenticated;
    return authenticated?.userId;
  }

  /// Require authentication or throw UnauthorizedException
  /// Returns the authenticated user ID
  static Future<int> requireAuthentication(Session session) async {
    final userId = await getAuthenticatedUserId(session);
    if (userId == null) {
      throw UnauthorizedException('Authentication required');
    }
    return userId;
  }

  /// Validate that the authenticated user owns the resource
  /// Throws ForbiddenException if user doesn't own the resource
  static Future<void> requireOwnership(
    Session session,
    int resourceOwnerId, {
    String? message,
  }) async {
    final userId = await requireAuthentication(session);
    if (userId != resourceOwnerId) {
      throw ForbiddenException(
        message ?? 'You do not have permission to access this resource',
      );
    }
  }

  /// Check if user is authenticated without throwing
  static Future<bool> isAuthenticated(Session session) async {
    final userId = await getAuthenticatedUserId(session);
    return userId != null;
  }
}

/// Exception thrown when user is not authenticated
class UnauthorizedException implements Exception {
  final String message;
  final int status = 401;

  UnauthorizedException([this.message = 'Unauthorized']);

  @override
  String toString() => 'UnauthorizedException: $message';
}

/// Exception thrown when user doesn't have permission
class ForbiddenException implements Exception {
  final String message;
  final int status = 403;

  ForbiddenException([this.message = 'Forbidden']);

  @override
  String toString() => 'ForbiddenException: $message';
}
