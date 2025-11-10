/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:discord_client/src/protocol/entity/discord_channel_entity.dart'
    as _i3;
import 'package:discord_client/src/protocol/entity/discord_group_entity.dart'
    as _i4;
import 'package:discord_client/src/protocol/enums/group_type.dart' as _i5;
import 'package:discord_client/src/protocol/discord_server.dart' as _i6;
import 'package:discord_client/src/protocol/entity/discord_server_entity.dart'
    as _i7;
import 'package:discord_client/src/protocol/discord_user.dart' as _i8;
import 'package:discord_client/src/protocol/enums/activity_status.dart' as _i9;
import 'package:discord_client/src/protocol/message.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
import 'protocol.dart' as _i12;

/// {@category Endpoint}
class EndpointDiscordChannel extends _i1.EndpointRef {
  EndpointDiscordChannel(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'discordChannel';

  _i2.Future<_i3.DiscordChannelEntity> getChannelById(int id) =>
      caller.callServerEndpoint<_i3.DiscordChannelEntity>(
        'discordChannel',
        'getChannelById',
        {'id': id},
      );

  _i2.Future<_i4.DiscordGroupEntity> createChannel(
    int serverId,
    String name,
    _i5.GroupType type,
  ) =>
      caller.callServerEndpoint<_i4.DiscordGroupEntity>(
        'discordChannel',
        'createChannel',
        {
          'serverId': serverId,
          'name': name,
          'type': type,
        },
      );
}

/// {@category Endpoint}
class EndpointDiscordGroup extends _i1.EndpointRef {
  EndpointDiscordGroup(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'discordGroup';

  _i2.Future<List<_i4.DiscordGroupEntity>> getAllGroups(int serverId) =>
      caller.callServerEndpoint<List<_i4.DiscordGroupEntity>>(
        'discordGroup',
        'getAllGroups',
        {'serverId': serverId},
      );

  _i2.Future<_i4.DiscordGroupEntity> getGroupById(int id) =>
      caller.callServerEndpoint<_i4.DiscordGroupEntity>(
        'discordGroup',
        'getGroupById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointDiscordServer extends _i1.EndpointRef {
  EndpointDiscordServer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'discordServer';

  _i2.Future<List<_i6.DiscordServer>> getServers() =>
      caller.callServerEndpoint<List<_i6.DiscordServer>>(
        'discordServer',
        'getServers',
        {},
      );

  _i2.Future<_i7.DiscordServerEntity> getServerById(int id) =>
      caller.callServerEndpoint<_i7.DiscordServerEntity>(
        'discordServer',
        'getServerById',
        {'id': id},
      );

  _i2.Future<List<_i6.DiscordServer>> getAllServers({
    List<int>? serverIds,
    int? userId,
  }) =>
      caller.callServerEndpoint<List<_i6.DiscordServer>>(
        'discordServer',
        'getAllServers',
        {
          'serverIds': serverIds,
          'userId': userId,
        },
      );

  _i2.Future<_i6.DiscordServer?> createDefaultServer() =>
      caller.callServerEndpoint<_i6.DiscordServer?>(
        'discordServer',
        'createDefaultServer',
        {},
      );

  _i2.Future<_i6.DiscordServer> createServer({
    required String serverName,
    required String serverBackground,
    required int creatorId,
  }) =>
      caller.callServerEndpoint<_i6.DiscordServer>(
        'discordServer',
        'createServer',
        {
          'serverName': serverName,
          'serverBackground': serverBackground,
          'creatorId': creatorId,
        },
      );
}

/// {@category Endpoint}
class EndpointDiscordUser extends _i1.EndpointRef {
  EndpointDiscordUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'discordUser';

  _i2.Future<_i8.DiscordUser> getUserDetails(int userId) =>
      caller.callServerEndpoint<_i8.DiscordUser>(
        'discordUser',
        'getUserDetails',
        {'userId': userId},
      );

  _i2.Future<void> updateUserStatus(
    int userId,
    _i9.ActivityStatus status,
  ) =>
      caller.callServerEndpoint<void>(
        'discordUser',
        'updateUserStatus',
        {
          'userId': userId,
          'status': status,
        },
      );

  _i2.Future<List<_i8.DiscordUser>> getUsers(int serverId) =>
      caller.callServerEndpoint<List<_i8.DiscordUser>>(
        'discordUser',
        'getUsers',
        {'serverId': serverId},
      );

  _i2.Future<void> addMemberToServer(
    int serverId,
    int userId,
  ) =>
      caller.callServerEndpoint<void>(
        'discordUser',
        'addMemberToServer',
        {
          'serverId': serverId,
          'userId': userId,
        },
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointLiveStream extends _i1.EndpointRef {
  EndpointLiveStream(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'liveStream';

  _i2.Future<String> generateToken(
    String userId,
    String roomName,
  ) =>
      caller.callServerEndpoint<String>(
        'liveStream',
        'generateToken',
        {
          'userId': userId,
          'roomName': roomName,
        },
      );
}

/// {@category Endpoint}
class EndpointMessage extends _i1.EndpointRef {
  EndpointMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'message';

  /// Fetch paginated messages
  /// [cursor] used to fetch data based on the id of the message we want to fetch the messages before (since the chat is reversed)
  _i2.Future<List<_i10.Message>> fetchChatsPaginated(
    int channelId,
    int cursor,
  ) =>
      caller.callServerEndpoint<List<_i10.Message>>(
        'message',
        'fetchChatsPaginated',
        {
          'channelId': channelId,
          'cursor': cursor,
        },
      );

  _i2.Future<_i10.Message> sendMessage(_i10.Message message) =>
      caller.callServerEndpoint<_i10.Message>(
        'message',
        'sendMessage',
        {'message': message},
      );

  _i2.Stream<_i10.Message> listenToMessages(int channelId) => caller
          .callStreamingServerEndpoint<_i2.Stream<_i10.Message>, _i10.Message>(
        'message',
        'listenToMessages',
        {'channelId': channelId},
        {},
      );

  _i2.Future<_i10.Message> deleteMessage(int messageId) =>
      caller.callServerEndpoint<_i10.Message>(
        'message',
        'deleteMessage',
        {'messageId': messageId},
      );

  _i2.Future<_i10.Message> editMessage(
    int messageId,
    String content,
  ) =>
      caller.callServerEndpoint<_i10.Message>(
        'message',
        'editMessage',
        {
          'messageId': messageId,
          'content': content,
        },
      );
}

/// {@category Endpoint}
class EndpointSearch extends _i1.EndpointRef {
  EndpointSearch(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'search';

  _i2.Future<List<_i10.Message>> searchMessages(
    int channelId,
    String query, {
    int? limit,
    int? offset,
    DateTime? fromDate,
    DateTime? toDate,
    int? senderId,
  }) =>
      caller.callServerEndpoint<List<_i10.Message>>(
        'search',
        'searchMessages',
        {
          'channelId': channelId,
          'query': query,
          'limit': limit,
          'offset': offset,
          'fromDate': fromDate,
          'toDate': toDate,
          'senderId': senderId,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i11.Caller(client);
  }

  late final _i11.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i12.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    discordChannel = EndpointDiscordChannel(this);
    discordGroup = EndpointDiscordGroup(this);
    discordServer = EndpointDiscordServer(this);
    discordUser = EndpointDiscordUser(this);
    example = EndpointExample(this);
    liveStream = EndpointLiveStream(this);
    message = EndpointMessage(this);
    search = EndpointSearch(this);
    modules = Modules(this);
  }

  late final EndpointDiscordChannel discordChannel;

  late final EndpointDiscordGroup discordGroup;

  late final EndpointDiscordServer discordServer;

  late final EndpointDiscordUser discordUser;

  late final EndpointExample example;

  late final EndpointLiveStream liveStream;

  late final EndpointMessage message;

  late final EndpointSearch search;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'discordChannel': discordChannel,
        'discordGroup': discordGroup,
        'discordServer': discordServer,
        'discordUser': discordUser,
        'example': example,
        'liveStream': liveStream,
        'message': message,
        'search': search,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
