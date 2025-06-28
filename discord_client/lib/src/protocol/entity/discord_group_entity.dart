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
import '../group.dart' as _i2;
import '../discord_channel.dart' as _i3;

abstract class DiscordGroupEntity implements _i1.SerializableModel {
  DiscordGroupEntity._({
    required this.group,
    required this.channels,
  });

  factory DiscordGroupEntity({
    required _i2.Group group,
    required List<_i3.DiscordChannel> channels,
  }) = _DiscordGroupEntityImpl;

  factory DiscordGroupEntity.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiscordGroupEntity(
      group: _i2.Group.fromJson(
          (jsonSerialization['group'] as Map<String, dynamic>)),
      channels: (jsonSerialization['channels'] as List)
          .map((e) => _i3.DiscordChannel.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  _i2.Group group;

  List<_i3.DiscordChannel> channels;

  /// Returns a shallow copy of this [DiscordGroupEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordGroupEntity copyWith({
    _i2.Group? group,
    List<_i3.DiscordChannel>? channels,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'group': group.toJson(),
      'channels': channels.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DiscordGroupEntityImpl extends DiscordGroupEntity {
  _DiscordGroupEntityImpl({
    required _i2.Group group,
    required List<_i3.DiscordChannel> channels,
  }) : super._(
          group: group,
          channels: channels,
        );

  /// Returns a shallow copy of this [DiscordGroupEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordGroupEntity copyWith({
    _i2.Group? group,
    List<_i3.DiscordChannel>? channels,
  }) {
    return DiscordGroupEntity(
      group: group ?? this.group.copyWith(),
      channels: channels ?? this.channels.map((e0) => e0.copyWith()).toList(),
    );
  }
}
