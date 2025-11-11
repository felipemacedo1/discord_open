import 'package:discord_server/src/utils/auth_helper.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockSession extends Mock implements Session {}

class MockAuthenticationInfo extends Mock implements AuthenticationInfo {}

void main() {
  group('AuthHelper', () {
    late MockSession mockSession;

    setUp(() {
      mockSession = MockSession();
    });

    group('getAuthenticatedUserId', () {
      test('returns userId when user is authenticated', () async {
        // Arrange
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(123);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Act
        final result = await AuthHelper.getAuthenticatedUserId(mockSession);

        // Assert
        expect(result, equals(123));
        verify(() => mockSession.authenticated).called(1);
      });

      test('returns null when user is not authenticated', () async {
        // Arrange
        when(() => mockSession.authenticated).thenAnswer((_) async => null);

        // Act
        final result = await AuthHelper.getAuthenticatedUserId(mockSession);

        // Assert
        expect(result, isNull);
        verify(() => mockSession.authenticated).called(1);
      });
    });

    group('requireAuthentication', () {
      test('returns userId when user is authenticated', () async {
        // Arrange
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(456);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Act
        final result = await AuthHelper.requireAuthentication(mockSession);

        // Assert
        expect(result, equals(456));
      });

      test('throws UnauthorizedException when user is not authenticated',
          () async {
        // Arrange
        when(() => mockSession.authenticated).thenAnswer((_) async => null);

        // Act & Assert
        expect(
          () => AuthHelper.requireAuthentication(mockSession),
          throwsA(isA<UnauthorizedException>()),
        );
      });

      test('UnauthorizedException has correct status code', () {
        // Arrange & Act
        final exception = UnauthorizedException('Test message');

        // Assert
        expect(exception.status, equals(401));
        expect(exception.message, equals('Test message'));
        expect(exception.toString(), contains('UnauthorizedException'));
        expect(exception.toString(), contains('Test message'));
      });

      test('UnauthorizedException has default message', () {
        // Arrange & Act
        final exception = UnauthorizedException();

        // Assert
        expect(exception.message, equals('Unauthorized'));
      });
    });

    group('requireOwnership', () {
      test('does not throw when user owns the resource', () async {
        // Arrange
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(789);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Act & Assert
        expect(
          () => AuthHelper.requireOwnership(mockSession, 789),
          returnsNormally,
        );
      });

      test('throws ForbiddenException when user does not own resource',
          () async {
        // Arrange
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(100);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Act & Assert
        expect(
          () => AuthHelper.requireOwnership(mockSession, 200),
          throwsA(isA<ForbiddenException>()),
        );
      });

      test('throws ForbiddenException with custom message', () async {
        // Arrange
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(100);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Act & Assert
        try {
          await AuthHelper.requireOwnership(
            mockSession,
            200,
            message: 'Custom forbidden message',
          );
          fail('Expected ForbiddenException to be thrown');
        } on ForbiddenException catch (e) {
          expect(e.message, equals('Custom forbidden message'));
        }
      });

      test('throws UnauthorizedException when user is not authenticated',
          () async {
        // Arrange
        when(() => mockSession.authenticated).thenAnswer((_) async => null);

        // Act & Assert
        expect(
          () => AuthHelper.requireOwnership(mockSession, 123),
          throwsA(isA<UnauthorizedException>()),
        );
      });

      test('ForbiddenException has correct status code', () {
        // Arrange & Act
        final exception = ForbiddenException('Test forbidden');

        // Assert
        expect(exception.status, equals(403));
        expect(exception.message, equals('Test forbidden'));
        expect(exception.toString(), contains('ForbiddenException'));
        expect(exception.toString(), contains('Test forbidden'));
      });

      test('ForbiddenException has default message', () {
        // Arrange & Act
        final exception = ForbiddenException();

        // Assert
        expect(exception.message, equals('Forbidden'));
      });
    });

    group('isAuthenticated', () {
      test('returns true when user is authenticated', () async {
        // Arrange
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(999);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Act
        final result = await AuthHelper.isAuthenticated(mockSession);

        // Assert
        expect(result, isTrue);
      });

      test('returns false when user is not authenticated', () async {
        // Arrange
        when(() => mockSession.authenticated).thenAnswer((_) async => null);

        // Act
        final result = await AuthHelper.isAuthenticated(mockSession);

        // Assert
        expect(result, isFalse);
      });
    });
  });
}
