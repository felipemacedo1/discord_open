/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/discord_channel_endpoint.dart' as _i2;
import '../endpoints/discord_group_endpoint.dart' as _i3;
import '../endpoints/discord_server_endpoint.dart' as _i4;
import '../endpoints/discord_user_endpoint.dart' as _i5;
import '../endpoints/example_endpoint.dart' as _i6;
import '../endpoints/live_stream_endpoint.dart' as _i7;
import '../endpoints/message_endpoint.dart' as _i8;
import '../endpoints/search_endpoint.dart' as _i9;
import 'package:discord_server/src/generated/enums/group_type.dart' as _i10;
import 'package:discord_server/src/generated/enums/activity_status.dart'
    as _i11;
import 'package:discord_server/src/generated/message.dart' as _i12;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i13;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'discordChannel': _i2.DiscordChannelEndpoint()
        ..initialize(
          server,
          'discordChannel',
          null,
        ),
      'discordGroup': _i3.DiscordGroupEndpoint()
        ..initialize(
          server,
          'discordGroup',
          null,
        ),
      'discordServer': _i4.DiscordServerEndpoint()
        ..initialize(
          server,
          'discordServer',
          null,
        ),
      'discordUser': _i5.DiscordUserEndpoint()
        ..initialize(
          server,
          'discordUser',
          null,
        ),
      'example': _i6.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'liveStream': _i7.LiveStreamEndpoint()
        ..initialize(
          server,
          'liveStream',
          null,
        ),
      'message': _i8.MessageEndpoint()
        ..initialize(
          server,
          'message',
          null,
        ),
      'search': _i9.SearchEndpoint()
        ..initialize(
          server,
          'search',
          null,
        ),
    };
    connectors['discordChannel'] = _i1.EndpointConnector(
      name: 'discordChannel',
      endpoint: endpoints['discordChannel']!,
      methodConnectors: {
        'getChannelById': _i1.MethodConnector(
          name: 'getChannelById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordChannel'] as _i2.DiscordChannelEndpoint)
                  .getChannelById(
            session,
            params['id'],
          ),
        ),
        'createChannel': _i1.MethodConnector(
          name: 'createChannel',
          params: {
            'serverId': _i1.ParameterDescription(
              name: 'serverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i10.GroupType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordChannel'] as _i2.DiscordChannelEndpoint)
                  .createChannel(
            session,
            params['serverId'],
            params['name'],
            params['type'],
          ),
        ),
      },
    );
    connectors['discordGroup'] = _i1.EndpointConnector(
      name: 'discordGroup',
      endpoint: endpoints['discordGroup']!,
      methodConnectors: {
        'getAllGroups': _i1.MethodConnector(
          name: 'getAllGroups',
          params: {
            'serverId': _i1.ParameterDescription(
              name: 'serverId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordGroup'] as _i3.DiscordGroupEndpoint)
                  .getAllGroups(
            session,
            params['serverId'],
          ),
        ),
        'getGroupById': _i1.MethodConnector(
          name: 'getGroupById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordGroup'] as _i3.DiscordGroupEndpoint)
                  .getGroupById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['discordServer'] = _i1.EndpointConnector(
      name: 'discordServer',
      endpoint: endpoints['discordServer']!,
      methodConnectors: {
        'getServers': _i1.MethodConnector(
          name: 'getServers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordServer'] as _i4.DiscordServerEndpoint)
                  .getServers(session),
        ),
        'getServerById': _i1.MethodConnector(
          name: 'getServerById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordServer'] as _i4.DiscordServerEndpoint)
                  .getServerById(
            session,
            params['id'],
          ),
        ),
        'getAllServers': _i1.MethodConnector(
          name: 'getAllServers',
          params: {
            'serverIds': _i1.ParameterDescription(
              name: 'serverIds',
              type: _i1.getType<List<int>?>(),
              nullable: true,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordServer'] as _i4.DiscordServerEndpoint)
                  .getAllServers(
            session,
            serverIds: params['serverIds'],
            userId: params['userId'],
          ),
        ),
        'createDefaultServer': _i1.MethodConnector(
          name: 'createDefaultServer',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordServer'] as _i4.DiscordServerEndpoint)
                  .createDefaultServer(session),
        ),
        'createServer': _i1.MethodConnector(
          name: 'createServer',
          params: {
            'serverName': _i1.ParameterDescription(
              name: 'serverName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'serverBackground': _i1.ParameterDescription(
              name: 'serverBackground',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'creatorId': _i1.ParameterDescription(
              name: 'creatorId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordServer'] as _i4.DiscordServerEndpoint)
                  .createServer(
            session,
            serverName: params['serverName'],
            serverBackground: params['serverBackground'],
            creatorId: params['creatorId'],
          ),
        ),
      },
    );
    connectors['discordUser'] = _i1.EndpointConnector(
      name: 'discordUser',
      endpoint: endpoints['discordUser']!,
      methodConnectors: {
        'getUserDetails': _i1.MethodConnector(
          name: 'getUserDetails',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordUser'] as _i5.DiscordUserEndpoint)
                  .getUserDetails(
            session,
            params['userId'],
          ),
        ),
        'updateUserStatus': _i1.MethodConnector(
          name: 'updateUserStatus',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i11.ActivityStatus>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordUser'] as _i5.DiscordUserEndpoint)
                  .updateUserStatus(
            session,
            params['userId'],
            params['status'],
          ),
        ),
        'getUsers': _i1.MethodConnector(
          name: 'getUsers',
          params: {
            'serverId': _i1.ParameterDescription(
              name: 'serverId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordUser'] as _i5.DiscordUserEndpoint).getUsers(
            session,
            params['serverId'],
          ),
        ),
        'addMemberToServer': _i1.MethodConnector(
          name: 'addMemberToServer',
          params: {
            'serverId': _i1.ParameterDescription(
              name: 'serverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['discordUser'] as _i5.DiscordUserEndpoint)
                  .addMemberToServer(
            session,
            params['serverId'],
            params['userId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i6.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['liveStream'] = _i1.EndpointConnector(
      name: 'liveStream',
      endpoint: endpoints['liveStream']!,
      methodConnectors: {
        'generateToken': _i1.MethodConnector(
          name: 'generateToken',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'roomName': _i1.ParameterDescription(
              name: 'roomName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['liveStream'] as _i7.LiveStreamEndpoint).generateToken(
            session,
            params['userId'],
            params['roomName'],
          ),
        )
      },
    );
    connectors['message'] = _i1.EndpointConnector(
      name: 'message',
      endpoint: endpoints['message']!,
      methodConnectors: {
        'fetchChatsPaginated': _i1.MethodConnector(
          name: 'fetchChatsPaginated',
          params: {
            'channelId': _i1.ParameterDescription(
              name: 'channelId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'cursor': _i1.ParameterDescription(
              name: 'cursor',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['message'] as _i8.MessageEndpoint).fetchChatsPaginated(
            session,
            params['channelId'],
            params['cursor'],
          ),
        ),
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i12.Message>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['message'] as _i8.MessageEndpoint).sendMessage(
            session,
            params['message'],
          ),
        ),
        'deleteMessage': _i1.MethodConnector(
          name: 'deleteMessage',
          params: {
            'messageId': _i1.ParameterDescription(
              name: 'messageId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['message'] as _i8.MessageEndpoint).deleteMessage(
            session,
            params['messageId'],
          ),
        ),
        'editMessage': _i1.MethodConnector(
          name: 'editMessage',
          params: {
            'messageId': _i1.ParameterDescription(
              name: 'messageId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['message'] as _i8.MessageEndpoint).editMessage(
            session,
            params['messageId'],
            params['content'],
          ),
        ),
        'listenToMessages': _i1.MethodStreamConnector(
          name: 'listenToMessages',
          params: {
            'channelId': _i1.ParameterDescription(
              name: 'channelId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['message'] as _i8.MessageEndpoint).listenToMessages(
            session,
            params['channelId'],
          ),
        ),
      },
    );
    connectors['search'] = _i1.EndpointConnector(
      name: 'search',
      endpoint: endpoints['search']!,
      methodConnectors: {
        'searchMessages': _i1.MethodConnector(
          name: 'searchMessages',
          params: {
            'channelId': _i1.ParameterDescription(
              name: 'channelId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'fromDate': _i1.ParameterDescription(
              name: 'fromDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'toDate': _i1.ParameterDescription(
              name: 'toDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'senderId': _i1.ParameterDescription(
              name: 'senderId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['search'] as _i9.SearchEndpoint).searchMessages(
            session,
            params['channelId'],
            params['query'],
            limit: params['limit'],
            offset: params['offset'],
            fromDate: params['fromDate'],
            toDate: params['toDate'],
            senderId: params['senderId'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i13.Endpoints()..initializeEndpoints(server);
  }
}
