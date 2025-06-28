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

abstract class DiscordServer implements _i1.SerializableModel {
  DiscordServer._({
    this.id,
    required this.name,
    required this.newMessagesCount,
    required this.newMessagesChats,
    required this.serverBackground,
    this.defaultChannelId,
  });

  factory DiscordServer({
    int? id,
    required String name,
    required int newMessagesCount,
    required int newMessagesChats,
    required String serverBackground,
    int? defaultChannelId,
  }) = _DiscordServerImpl;

  factory DiscordServer.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiscordServer(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      newMessagesCount: jsonSerialization['newMessagesCount'] as int,
      newMessagesChats: jsonSerialization['newMessagesChats'] as int,
      serverBackground: jsonSerialization['serverBackground'] as String,
      defaultChannelId: jsonSerialization['defaultChannelId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int newMessagesCount;

  int newMessagesChats;

  String serverBackground;

  int? defaultChannelId;

  /// Returns a shallow copy of this [DiscordServer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordServer copyWith({
    int? id,
    String? name,
    int? newMessagesCount,
    int? newMessagesChats,
    String? serverBackground,
    int? defaultChannelId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'newMessagesCount': newMessagesCount,
      'newMessagesChats': newMessagesChats,
      'serverBackground': serverBackground,
      if (defaultChannelId != null) 'defaultChannelId': defaultChannelId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiscordServerImpl extends DiscordServer {
  _DiscordServerImpl({
    int? id,
    required String name,
    required int newMessagesCount,
    required int newMessagesChats,
    required String serverBackground,
    int? defaultChannelId,
  }) : super._(
          id: id,
          name: name,
          newMessagesCount: newMessagesCount,
          newMessagesChats: newMessagesChats,
          serverBackground: serverBackground,
          defaultChannelId: defaultChannelId,
        );

  /// Returns a shallow copy of this [DiscordServer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordServer copyWith({
    Object? id = _Undefined,
    String? name,
    int? newMessagesCount,
    int? newMessagesChats,
    String? serverBackground,
    Object? defaultChannelId = _Undefined,
  }) {
    return DiscordServer(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      newMessagesCount: newMessagesCount ?? this.newMessagesCount,
      newMessagesChats: newMessagesChats ?? this.newMessagesChats,
      serverBackground: serverBackground ?? this.serverBackground,
      defaultChannelId:
          defaultChannelId is int? ? defaultChannelId : this.defaultChannelId,
    );
  }
}
