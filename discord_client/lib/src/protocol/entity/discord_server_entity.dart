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
import '../discord_server.dart' as _i2;
import '../group.dart' as _i3;

abstract class DiscordServerEntity implements _i1.SerializableModel {
  DiscordServerEntity._({
    required this.server,
    required this.groups,
  });

  factory DiscordServerEntity({
    required _i2.DiscordServer server,
    required List<_i3.Group> groups,
  }) = _DiscordServerEntityImpl;

  factory DiscordServerEntity.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiscordServerEntity(
      server: _i2.DiscordServer.fromJson(
          (jsonSerialization['server'] as Map<String, dynamic>)),
      groups: (jsonSerialization['groups'] as List)
          .map((e) => _i3.Group.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  _i2.DiscordServer server;

  List<_i3.Group> groups;

  /// Returns a shallow copy of this [DiscordServerEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordServerEntity copyWith({
    _i2.DiscordServer? server,
    List<_i3.Group>? groups,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'server': server.toJson(),
      'groups': groups.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DiscordServerEntityImpl extends DiscordServerEntity {
  _DiscordServerEntityImpl({
    required _i2.DiscordServer server,
    required List<_i3.Group> groups,
  }) : super._(
          server: server,
          groups: groups,
        );

  /// Returns a shallow copy of this [DiscordServerEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordServerEntity copyWith({
    _i2.DiscordServer? server,
    List<_i3.Group>? groups,
  }) {
    return DiscordServerEntity(
      server: server ?? this.server.copyWith(),
      groups: groups ?? this.groups.map((e0) => e0.copyWith()).toList(),
    );
  }
}
