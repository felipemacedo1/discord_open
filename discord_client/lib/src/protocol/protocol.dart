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
import 'discord_channel.dart' as _i2;
import 'discord_server.dart' as _i3;
import 'discord_user.dart' as _i4;
import 'entity/discord_channel_entity.dart' as _i5;
import 'entity/discord_group_entity.dart' as _i6;
import 'entity/discord_server_entity.dart' as _i7;
import 'enums/activity_status.dart' as _i8;
import 'enums/group_type.dart' as _i9;
import 'example.dart' as _i10;
import 'exceptions/message_not_sent_exception.dart' as _i11;
import 'exceptions/not_found_exception.dart' as _i12;
import 'group.dart' as _i13;
import 'message.dart' as _i14;
import 'server_membership.dart' as _i15;
import 'package:discord_client/src/protocol/entity/discord_group_entity.dart'
    as _i16;
import 'package:discord_client/src/protocol/discord_server.dart' as _i17;
import 'package:discord_client/src/protocol/discord_user.dart' as _i18;
import 'package:discord_client/src/protocol/message.dart' as _i19;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i20;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.DiscordChannel) {
      return _i2.DiscordChannel.fromJson(data) as T;
    }
    if (t == _i3.DiscordServer) {
      return _i3.DiscordServer.fromJson(data) as T;
    }
    if (t == _i4.DiscordUser) {
      return _i4.DiscordUser.fromJson(data) as T;
    }
    if (t == _i5.DiscordChannelEntity) {
      return _i5.DiscordChannelEntity.fromJson(data) as T;
    }
    if (t == _i6.DiscordGroupEntity) {
      return _i6.DiscordGroupEntity.fromJson(data) as T;
    }
    if (t == _i7.DiscordServerEntity) {
      return _i7.DiscordServerEntity.fromJson(data) as T;
    }
    if (t == _i8.ActivityStatus) {
      return _i8.ActivityStatus.fromJson(data) as T;
    }
    if (t == _i9.GroupType) {
      return _i9.GroupType.fromJson(data) as T;
    }
    if (t == _i10.Example) {
      return _i10.Example.fromJson(data) as T;
    }
    if (t == _i11.MessageNotSentException) {
      return _i11.MessageNotSentException.fromJson(data) as T;
    }
    if (t == _i12.NotFoundException) {
      return _i12.NotFoundException.fromJson(data) as T;
    }
    if (t == _i13.Group) {
      return _i13.Group.fromJson(data) as T;
    }
    if (t == _i14.Message) {
      return _i14.Message.fromJson(data) as T;
    }
    if (t == _i15.ServerMembership) {
      return _i15.ServerMembership.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.DiscordChannel?>()) {
      return (data != null ? _i2.DiscordChannel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DiscordServer?>()) {
      return (data != null ? _i3.DiscordServer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DiscordUser?>()) {
      return (data != null ? _i4.DiscordUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DiscordChannelEntity?>()) {
      return (data != null ? _i5.DiscordChannelEntity.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.DiscordGroupEntity?>()) {
      return (data != null ? _i6.DiscordGroupEntity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DiscordServerEntity?>()) {
      return (data != null ? _i7.DiscordServerEntity.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.ActivityStatus?>()) {
      return (data != null ? _i8.ActivityStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GroupType?>()) {
      return (data != null ? _i9.GroupType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Example?>()) {
      return (data != null ? _i10.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.MessageNotSentException?>()) {
      return (data != null ? _i11.MessageNotSentException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.NotFoundException?>()) {
      return (data != null ? _i12.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Group?>()) {
      return (data != null ? _i13.Group.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Message?>()) {
      return (data != null ? _i14.Message.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ServerMembership?>()) {
      return (data != null ? _i15.ServerMembership.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i15.ServerMembership>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i15.ServerMembership>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i14.Message>) {
      return (data as List).map((e) => deserialize<_i14.Message>(e)).toList()
          as T;
    }
    if (t == List<_i2.DiscordChannel>) {
      return (data as List)
          .map((e) => deserialize<_i2.DiscordChannel>(e))
          .toList() as T;
    }
    if (t == List<_i13.Group>) {
      return (data as List).map((e) => deserialize<_i13.Group>(e)).toList()
          as T;
    }
    if (t == List<_i16.DiscordGroupEntity>) {
      return (data as List)
          .map((e) => deserialize<_i16.DiscordGroupEntity>(e))
          .toList() as T;
    }
    if (t == List<_i17.DiscordServer>) {
      return (data as List)
          .map((e) => deserialize<_i17.DiscordServer>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i18.DiscordUser>) {
      return (data as List)
          .map((e) => deserialize<_i18.DiscordUser>(e))
          .toList() as T;
    }
    if (t == List<_i19.Message>) {
      return (data as List).map((e) => deserialize<_i19.Message>(e)).toList()
          as T;
    }
    try {
      return _i20.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.DiscordChannel) {
      return 'DiscordChannel';
    }
    if (data is _i3.DiscordServer) {
      return 'DiscordServer';
    }
    if (data is _i4.DiscordUser) {
      return 'DiscordUser';
    }
    if (data is _i5.DiscordChannelEntity) {
      return 'DiscordChannelEntity';
    }
    if (data is _i6.DiscordGroupEntity) {
      return 'DiscordGroupEntity';
    }
    if (data is _i7.DiscordServerEntity) {
      return 'DiscordServerEntity';
    }
    if (data is _i8.ActivityStatus) {
      return 'ActivityStatus';
    }
    if (data is _i9.GroupType) {
      return 'GroupType';
    }
    if (data is _i10.Example) {
      return 'Example';
    }
    if (data is _i11.MessageNotSentException) {
      return 'MessageNotSentException';
    }
    if (data is _i12.NotFoundException) {
      return 'NotFoundException';
    }
    if (data is _i13.Group) {
      return 'Group';
    }
    if (data is _i14.Message) {
      return 'Message';
    }
    if (data is _i15.ServerMembership) {
      return 'ServerMembership';
    }
    className = _i20.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.DiscordChannel>(data['data']);
    }
    if (dataClassName == 'DiscordServer') {
      return deserialize<_i3.DiscordServer>(data['data']);
    }
    if (dataClassName == 'DiscordUser') {
      return deserialize<_i4.DiscordUser>(data['data']);
    }
    if (dataClassName == 'DiscordChannelEntity') {
      return deserialize<_i5.DiscordChannelEntity>(data['data']);
    }
    if (dataClassName == 'DiscordGroupEntity') {
      return deserialize<_i6.DiscordGroupEntity>(data['data']);
    }
    if (dataClassName == 'DiscordServerEntity') {
      return deserialize<_i7.DiscordServerEntity>(data['data']);
    }
    if (dataClassName == 'ActivityStatus') {
      return deserialize<_i8.ActivityStatus>(data['data']);
    }
    if (dataClassName == 'GroupType') {
      return deserialize<_i9.GroupType>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i10.Example>(data['data']);
    }
    if (dataClassName == 'MessageNotSentException') {
      return deserialize<_i11.MessageNotSentException>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i12.NotFoundException>(data['data']);
    }
    if (dataClassName == 'Group') {
      return deserialize<_i13.Group>(data['data']);
    }
    if (dataClassName == 'Message') {
      return deserialize<_i14.Message>(data['data']);
    }
    if (dataClassName == 'ServerMembership') {
      return deserialize<_i15.ServerMembership>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i20.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
