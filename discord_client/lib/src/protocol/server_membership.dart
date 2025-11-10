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
import 'discord_user.dart' as _i2;

abstract class ServerMembership implements _i1.SerializableModel {
  ServerMembership._({
    this.id,
    required this.userId,
    required this.serverId,
    required this.discordUserId,
    this.discordUser,
  });

  factory ServerMembership({
    int? id,
    required int userId,
    required int serverId,
    required int discordUserId,
    _i2.DiscordUser? discordUser,
  }) = _ServerMembershipImpl;

  factory ServerMembership.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerMembership(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      serverId: jsonSerialization['serverId'] as int,
      discordUserId: jsonSerialization['discordUserId'] as int,
      discordUser: jsonSerialization['discordUser'] == null
          ? null
          : _i2.DiscordUser.fromJson(
              (jsonSerialization['discordUser'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int serverId;

  int discordUserId;

  _i2.DiscordUser? discordUser;

  /// Returns a shallow copy of this [ServerMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerMembership copyWith({
    int? id,
    int? userId,
    int? serverId,
    int? discordUserId,
    _i2.DiscordUser? discordUser,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'serverId': serverId,
      'discordUserId': discordUserId,
      if (discordUser != null) 'discordUser': discordUser?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerMembershipImpl extends ServerMembership {
  _ServerMembershipImpl({
    int? id,
    required int userId,
    required int serverId,
    required int discordUserId,
    _i2.DiscordUser? discordUser,
  }) : super._(
          id: id,
          userId: userId,
          serverId: serverId,
          discordUserId: discordUserId,
          discordUser: discordUser,
        );

  /// Returns a shallow copy of this [ServerMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerMembership copyWith({
    Object? id = _Undefined,
    int? userId,
    int? serverId,
    int? discordUserId,
    Object? discordUser = _Undefined,
  }) {
    return ServerMembership(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      serverId: serverId ?? this.serverId,
      discordUserId: discordUserId ?? this.discordUserId,
      discordUser: discordUser is _i2.DiscordUser?
          ? discordUser
          : this.discordUser?.copyWith(),
    );
  }
}
