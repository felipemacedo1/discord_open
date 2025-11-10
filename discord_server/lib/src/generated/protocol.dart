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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'discord_channel.dart' as _i4;
import 'discord_server.dart' as _i5;
import 'discord_user.dart' as _i6;
import 'entity/discord_channel_entity.dart' as _i7;
import 'entity/discord_group_entity.dart' as _i8;
import 'entity/discord_server_entity.dart' as _i9;
import 'enums/activity_status.dart' as _i10;
import 'enums/group_type.dart' as _i11;
import 'example.dart' as _i12;
import 'exceptions/message_not_sent_exception.dart' as _i13;
import 'exceptions/not_found_exception.dart' as _i14;
import 'group.dart' as _i15;
import 'message.dart' as _i16;
import 'server_membership.dart' as _i17;
import 'package:discord_server/src/generated/entity/discord_group_entity.dart'
    as _i18;
import 'package:discord_server/src/generated/discord_server.dart' as _i19;
import 'package:discord_server/src/generated/discord_user.dart' as _i20;
import 'package:discord_server/src/generated/message.dart' as _i21;
export 'discord_channel.dart';
export 'discord_server.dart';
export 'discord_user.dart';
export 'entity/discord_channel_entity.dart';
export 'entity/discord_group_entity.dart';
export 'entity/discord_server_entity.dart';
export 'enums/activity_status.dart';
export 'enums/group_type.dart';
export 'example.dart';
export 'exceptions/message_not_sent_exception.dart';
export 'exceptions/not_found_exception.dart';
export 'group.dart';
export 'message.dart';
export 'server_membership.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'discord_channel',
      dartName: 'DiscordChannel',
      schema: 'public',
      module: 'discord',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'discord_channel_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'icon',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'groupId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'discordServerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:GroupType',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'discord_channel_fk_0',
          columns: ['groupId'],
          referenceTable: 'group',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'discord_channel_fk_1',
          columns: ['discordServerId'],
          referenceTable: 'discord_server',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'discord_channel_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'discord_server',
      dartName: 'DiscordServer',
      schema: 'public',
      module: 'discord',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'discord_server_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'newMessagesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'newMessagesChats',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'serverBackground',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'defaultChannelId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'discord_server_fk_0',
          columns: ['defaultChannelId'],
          referenceTable: 'discord_channel',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'discord_server_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'discord_user',
      dartName: 'DiscordUser',
      schema: 'public',
      module: 'discord',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'discord_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:ActivityStatus',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'discord_user_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'discord_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'group',
      dartName: 'Group',
      schema: 'public',
      module: 'discord',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'group_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'discordServerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:GroupType',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'group_fk_0',
          columns: ['discordServerId'],
          referenceTable: 'discord_server',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'group_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'message',
      dartName: 'Message',
      schema: 'public',
      module: 'discord',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'senderInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contentType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'timeStamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'channelId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'isDelivered',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'message_fk_0',
          columns: ['senderInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'message_fk_1',
          columns: ['channelId'],
          referenceTable: 'discord_channel',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'server_membership',
      dartName: 'ServerMembership',
      schema: 'public',
      module: 'discord',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'server_membership_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'serverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'discordUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: '_discordUserMembersDiscordUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'server_membership_fk_0',
          columns: ['userId'],
          referenceTable: 'discord_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'server_membership_fk_1',
          columns: ['serverId'],
          referenceTable: 'discord_server',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'server_membership_fk_2',
          columns: ['discordUserId'],
          referenceTable: 'discord_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'server_membership_fk_3',
          columns: ['_discordUserMembersDiscordUserId'],
          referenceTable: 'discord_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'server_membership_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.DiscordChannel) {
      return _i4.DiscordChannel.fromJson(data) as T;
    }
    if (t == _i5.DiscordServer) {
      return _i5.DiscordServer.fromJson(data) as T;
    }
    if (t == _i6.DiscordUser) {
      return _i6.DiscordUser.fromJson(data) as T;
    }
    if (t == _i7.DiscordChannelEntity) {
      return _i7.DiscordChannelEntity.fromJson(data) as T;
    }
    if (t == _i8.DiscordGroupEntity) {
      return _i8.DiscordGroupEntity.fromJson(data) as T;
    }
    if (t == _i9.DiscordServerEntity) {
      return _i9.DiscordServerEntity.fromJson(data) as T;
    }
    if (t == _i10.ActivityStatus) {
      return _i10.ActivityStatus.fromJson(data) as T;
    }
    if (t == _i11.GroupType) {
      return _i11.GroupType.fromJson(data) as T;
    }
    if (t == _i12.Example) {
      return _i12.Example.fromJson(data) as T;
    }
    if (t == _i13.MessageNotSentException) {
      return _i13.MessageNotSentException.fromJson(data) as T;
    }
    if (t == _i14.NotFoundException) {
      return _i14.NotFoundException.fromJson(data) as T;
    }
    if (t == _i15.Group) {
      return _i15.Group.fromJson(data) as T;
    }
    if (t == _i16.Message) {
      return _i16.Message.fromJson(data) as T;
    }
    if (t == _i17.ServerMembership) {
      return _i17.ServerMembership.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.DiscordChannel?>()) {
      return (data != null ? _i4.DiscordChannel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DiscordServer?>()) {
      return (data != null ? _i5.DiscordServer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DiscordUser?>()) {
      return (data != null ? _i6.DiscordUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DiscordChannelEntity?>()) {
      return (data != null ? _i7.DiscordChannelEntity.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.DiscordGroupEntity?>()) {
      return (data != null ? _i8.DiscordGroupEntity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DiscordServerEntity?>()) {
      return (data != null ? _i9.DiscordServerEntity.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.ActivityStatus?>()) {
      return (data != null ? _i10.ActivityStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GroupType?>()) {
      return (data != null ? _i11.GroupType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Example?>()) {
      return (data != null ? _i12.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.MessageNotSentException?>()) {
      return (data != null ? _i13.MessageNotSentException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.NotFoundException?>()) {
      return (data != null ? _i14.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Group?>()) {
      return (data != null ? _i15.Group.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Message?>()) {
      return (data != null ? _i16.Message.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ServerMembership?>()) {
      return (data != null ? _i17.ServerMembership.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i17.ServerMembership>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i17.ServerMembership>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i16.Message>) {
      return (data as List).map((e) => deserialize<_i16.Message>(e)).toList()
          as T;
    }
    if (t == List<_i4.DiscordChannel>) {
      return (data as List)
          .map((e) => deserialize<_i4.DiscordChannel>(e))
          .toList() as T;
    }
    if (t == List<_i15.Group>) {
      return (data as List).map((e) => deserialize<_i15.Group>(e)).toList()
          as T;
    }
    if (t == List<_i18.DiscordGroupEntity>) {
      return (data as List)
          .map((e) => deserialize<_i18.DiscordGroupEntity>(e))
          .toList() as T;
    }
    if (t == List<_i19.DiscordServer>) {
      return (data as List)
          .map((e) => deserialize<_i19.DiscordServer>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i20.DiscordUser>) {
      return (data as List)
          .map((e) => deserialize<_i20.DiscordUser>(e))
          .toList() as T;
    }
    if (t == List<_i21.Message>) {
      return (data as List).map((e) => deserialize<_i21.Message>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.DiscordChannel) {
      return 'DiscordChannel';
    }
    if (data is _i5.DiscordServer) {
      return 'DiscordServer';
    }
    if (data is _i6.DiscordUser) {
      return 'DiscordUser';
    }
    if (data is _i7.DiscordChannelEntity) {
      return 'DiscordChannelEntity';
    }
    if (data is _i8.DiscordGroupEntity) {
      return 'DiscordGroupEntity';
    }
    if (data is _i9.DiscordServerEntity) {
      return 'DiscordServerEntity';
    }
    if (data is _i10.ActivityStatus) {
      return 'ActivityStatus';
    }
    if (data is _i11.GroupType) {
      return 'GroupType';
    }
    if (data is _i12.Example) {
      return 'Example';
    }
    if (data is _i13.MessageNotSentException) {
      return 'MessageNotSentException';
    }
    if (data is _i14.NotFoundException) {
      return 'NotFoundException';
    }
    if (data is _i15.Group) {
      return 'Group';
    }
    if (data is _i16.Message) {
      return 'Message';
    }
    if (data is _i17.ServerMembership) {
      return 'ServerMembership';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'DiscordChannel') {
      return deserialize<_i4.DiscordChannel>(data['data']);
    }
    if (dataClassName == 'DiscordServer') {
      return deserialize<_i5.DiscordServer>(data['data']);
    }
    if (dataClassName == 'DiscordUser') {
      return deserialize<_i6.DiscordUser>(data['data']);
    }
    if (dataClassName == 'DiscordChannelEntity') {
      return deserialize<_i7.DiscordChannelEntity>(data['data']);
    }
    if (dataClassName == 'DiscordGroupEntity') {
      return deserialize<_i8.DiscordGroupEntity>(data['data']);
    }
    if (dataClassName == 'DiscordServerEntity') {
      return deserialize<_i9.DiscordServerEntity>(data['data']);
    }
    if (dataClassName == 'ActivityStatus') {
      return deserialize<_i10.ActivityStatus>(data['data']);
    }
    if (dataClassName == 'GroupType') {
      return deserialize<_i11.GroupType>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i12.Example>(data['data']);
    }
    if (dataClassName == 'MessageNotSentException') {
      return deserialize<_i13.MessageNotSentException>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i14.NotFoundException>(data['data']);
    }
    if (dataClassName == 'Group') {
      return deserialize<_i15.Group>(data['data']);
    }
    if (dataClassName == 'Message') {
      return deserialize<_i16.Message>(data['data']);
    }
    if (dataClassName == 'ServerMembership') {
      return deserialize<_i17.ServerMembership>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.DiscordChannel:
        return _i4.DiscordChannel.t;
      case _i5.DiscordServer:
        return _i5.DiscordServer.t;
      case _i6.DiscordUser:
        return _i6.DiscordUser.t;
      case _i15.Group:
        return _i15.Group.t;
      case _i16.Message:
        return _i16.Message.t;
      case _i17.ServerMembership:
        return _i17.ServerMembership.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'discord';
}
