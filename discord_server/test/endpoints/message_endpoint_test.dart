import 'package:discord_server/src/endpoints/message_endpoint.dart';
import 'package:discord_server/src/generated/protocol.dart';
import 'package:discord_server/src/utils/auth_helper.dart';
import 'package:discord_server/src/utils/rate_limiter.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockSession extends Mock implements Session {}

class MockDatabase extends Mock implements Database {}

class MockMessagingCentral extends Mock implements MessagingCentral {}

class MockAuthenticationInfo extends Mock implements AuthenticationInfo {}

class MockTransaction extends Mock {}

void main() {
  group('MessageEndpoint', () {
    late MessageEndpoint endpoint;
    late MockSession mockSession;
    late MockDatabase mockDatabase;
    late MockMessagingCentral mockMessaging;

    setUp(() {
      endpoint = MessageEndpoint();
      mockSession = MockSession();
      mockDatabase = MockDatabase();
      mockMessaging = MockMessagingCentral();

      // Setup default mocks
      when(() => mockSession.db).thenReturn(mockDatabase);
      when(() => mockSession.messages).thenReturn(mockMessaging);
    });

    tearDown(() {
      // Reset rate limiters after each test
      RateLimiters.messages.clearAll();
    });

    group('requireLogin', () {
      test('endpoint requires authentication', () {
        // Assert
        expect(endpoint.requireLogin, isTrue,
            reason: 'MessageEndpoint should require login');
      });
    });

    group('sendMessage - Authentication', () {
      test('throws UnauthorizedException when user is not authenticated',
          () async {
        // Arrange
        final message = Message(
          channelId: 1,
          senderInfoId: 123,
          content: 'Test message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: false,
        );

        when(() => mockSession.authenticated).thenAnswer((_) async => null);

        // Act & Assert
        expect(
          () => endpoint.sendMessage(mockSession, message),
          throwsA(isA<UnauthorizedException>()),
        );
      });

      test('throws ForbiddenException when sender mismatch', () async {
        // Arrange
        final authenticatedUserId = 123;
        final differentUserId = 456;

        final message = Message(
          channelId: 1,
          senderInfoId: differentUserId, // Different from authenticated user
          content: 'Test message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: false,
        );

        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        // Mock transaction
        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        // Act & Assert
        expect(
          () => endpoint.sendMessage(mockSession, message),
          throwsA(isA<ForbiddenException>()),
        );
      });
    });

    group('sendMessage - Rate Limiting', () {
      test('allows messages within rate limit', () async {
        // Arrange
        final authenticatedUserId = 123;
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        final message = Message(
          id: 1,
          channelId: 1,
          senderInfoId: authenticatedUserId,
          content: 'Test message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: false,
        );

        final discordUser = DiscordUser(
          id: authenticatedUserId,
          userInfo: UserInfo(
            id: authenticatedUserId,
            userName: 'testuser',
            email: 'test@example.com',
            created: DateTime.now(),
            blocked: false,
            scopeNames: [],
          ),
        );

        // Mock database operations
        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        when(() => DiscordUser.db.findById(
              mockSession,
              authenticatedUserId,
              include: any(named: 'include'),
            )).thenAnswer((_) async => discordUser);

        when(() => Message.db.insertRow(
              mockSession,
              any(),
            )).thenAnswer((_) async => message);

        when(() => mockMessaging.postMessage(any(), any()))
            .thenAnswer((_) async => true);

        when(() => Message.db.updateRow(mockSession, any()))
            .thenAnswer((_) async => message.copyWith(isDelivered: true));

        // Act - Send 5 messages (within limit)
        for (int i = 0; i < 5; i++) {
          final result = await endpoint.sendMessage(mockSession, message);
          expect(result, isNotNull);
        }

        // No exception should be thrown
      });

      test('throws RateLimitExceededException when exceeding limit', () async {
        // Arrange
        final authenticatedUserId = 456;
        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        final message = Message(
          id: 1,
          channelId: 1,
          senderInfoId: authenticatedUserId,
          content: 'Test message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: false,
        );

        final discordUser = DiscordUser(
          id: authenticatedUserId,
          userInfo: UserInfo(
            id: authenticatedUserId,
            userName: 'testuser',
            email: 'test@example.com',
            created: DateTime.now(),
            blocked: false,
            scopeNames: [],
          ),
        );

        // Mock database operations
        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        when(() => DiscordUser.db.findById(
              mockSession,
              authenticatedUserId,
              include: any(named: 'include'),
            )).thenAnswer((_) async => discordUser);

        when(() => Message.db.insertRow(mockSession, any()))
            .thenAnswer((_) async => message);

        when(() => mockMessaging.postMessage(any(), any()))
            .thenAnswer((_) async => true);

        when(() => Message.db.updateRow(mockSession, any()))
            .thenAnswer((_) async => message.copyWith(isDelivered: true));

        // Act - Send 5 messages (at limit)
        for (int i = 0; i < 5; i++) {
          await endpoint.sendMessage(mockSession, message);
        }

        // Assert - 6th message should throw
        expect(
          () => endpoint.sendMessage(mockSession, message),
          throwsA(isA<RateLimitExceededException>()),
        );
      });
    });

    group('deleteMessage - Authorization', () {
      test('throws UnauthorizedException when user is not authenticated',
          () async {
        // Arrange
        when(() => mockSession.authenticated).thenAnswer((_) async => null);

        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        // Act & Assert
        expect(
          () => endpoint.deleteMessage(mockSession, 1),
          throwsA(isA<UnauthorizedException>()),
        );
      });

      test('throws ForbiddenException when user tries to delete others message',
          () async {
        // Arrange
        final authenticatedUserId = 123;
        final messageOwnerId = 456; // Different user

        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        final message = Message(
          id: 1,
          channelId: 1,
          senderInfoId: messageOwnerId,
          content: 'Test message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: true,
        );

        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        when(() => Message.db.findById(
              mockSession,
              1,
              include: any(named: 'include'),
            )).thenAnswer((_) async => message);

        // Act & Assert
        expect(
          () => endpoint.deleteMessage(mockSession, 1),
          throwsA(isA<ForbiddenException>()),
        );
      });

      test('allows user to delete their own message', () async {
        // Arrange
        final authenticatedUserId = 123;

        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        final message = Message(
          id: 1,
          channelId: 1,
          senderInfoId: authenticatedUserId, // Same as authenticated user
          content: 'Test message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: true,
        );

        final deletedMessage = message.copyWith(isDeleted: true);

        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        when(() => Message.db.findById(
              mockSession,
              1,
              include: any(named: 'include'),
            )).thenAnswer((_) async => message);

        when(() => Message.db.updateRow(mockSession, any()))
            .thenAnswer((_) async => 1);

        when(() => Message.db.findById(
              mockSession,
              1,
              include: any(named: 'include'),
            )).thenAnswer((_) async => deletedMessage);

        // Act
        final result = await endpoint.deleteMessage(mockSession, 1);

        // Assert
        expect(result.isDeleted, isTrue);
      });
    });

    group('editMessage - Authorization', () {
      test('throws ForbiddenException when user tries to edit others message',
          () async {
        // Arrange
        final authenticatedUserId = 123;
        final messageOwnerId = 456;

        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        final message = Message(
          id: 1,
          channelId: 1,
          senderInfoId: messageOwnerId,
          content: 'Original message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: true,
        );

        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        when(() => Message.db.findById(
              mockSession,
              1,
              include: any(named: 'include'),
            )).thenAnswer((_) async => message);

        // Act & Assert
        expect(
          () => endpoint.editMessage(mockSession, 1, 'Edited message'),
          throwsA(isA<ForbiddenException>()),
        );
      });

      test('allows user to edit their own message', () async {
        // Arrange
        final authenticatedUserId = 123;

        final mockAuth = MockAuthenticationInfo();
        when(() => mockAuth.userId).thenReturn(authenticatedUserId);
        when(() => mockSession.authenticated).thenAnswer((_) async => mockAuth);

        final message = Message(
          id: 1,
          channelId: 1,
          senderInfoId: authenticatedUserId,
          content: 'Original message',
          timeStamp: DateTime.now(),
          isDeleted: false,
          isDelivered: true,
        );

        final editedMessage =
            message.copyWith(content: 'Edited message');

        when(() => mockDatabase.transaction(any())).thenAnswer((invocation) {
          final callback = invocation.positionalArguments[0] as Function;
          return callback(MockTransaction());
        });

        when(() => Message.db.findById(
              mockSession,
              1,
              include: any(named: 'include'),
            )).thenAnswer((_) async => message);

        when(() => Message.db.updateRow(mockSession, any()))
            .thenAnswer((_) async => 1);

        when(() => Message.db.findById(
              mockSession,
              1,
              include: any(named: 'include'),
            )).thenAnswer((_) async => editedMessage);

        // Act
        final result = await endpoint.editMessage(mockSession, 1, 'Edited message');

        // Assert
        expect(result.content, equals('Edited message'));
      });
    });
  });
}
