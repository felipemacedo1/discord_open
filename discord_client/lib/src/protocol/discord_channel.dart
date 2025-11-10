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
import 'enums/group_type.dart' as _i2;

abstract class DiscordChannel implements _i1.SerializableModel {
  DiscordChannel._({
    this.id,
    required this.name,
    required this.icon,
    required this.groupId,
    required this.discordServerId,
    required this.type,
  });

  factory DiscordChannel({
    int? id,
    required String name,
    required String icon,
    required int groupId,
    required int discordServerId,
    required _i2.GroupType type,
  }) = _DiscordChannelImpl;

  factory DiscordChannel.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiscordChannel(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      icon: jsonSerialization['icon'] as String,
      groupId: jsonSerialization['groupId'] as int,
      discordServerId: jsonSerialization['discordServerId'] as int,
      type: _i2.GroupType.fromJson((jsonSerialization['type'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String icon;

  int groupId;

  int discordServerId;

  _i2.GroupType type;

  /// Returns a shallow copy of this [DiscordChannel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordChannel copyWith({
    int? id,
    String? name,
    String? icon,
    int? groupId,
    int? discordServerId,
    _i2.GroupType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'icon': icon,
      'groupId': groupId,
      'discordServerId': discordServerId,
      'type': type.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiscordChannelImpl extends DiscordChannel {
  _DiscordChannelImpl({
    int? id,
    required String name,
    required String icon,
    required int groupId,
    required int discordServerId,
    required _i2.GroupType type,
  }) : super._(
          id: id,
          name: name,
          icon: icon,
          groupId: groupId,
          discordServerId: discordServerId,
          type: type,
        );

  /// Returns a shallow copy of this [DiscordChannel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordChannel copyWith({
    Object? id = _Undefined,
    String? name,
    String? icon,
    int? groupId,
    int? discordServerId,
    _i2.GroupType? type,
  }) {
    return DiscordChannel(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      groupId: groupId ?? this.groupId,
      discordServerId: discordServerId ?? this.discordServerId,
      type: type ?? this.type,
    );
  }
}
