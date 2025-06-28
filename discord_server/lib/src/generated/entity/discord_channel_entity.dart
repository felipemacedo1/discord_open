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
import '../discord_channel.dart' as _i2;
import '../message.dart' as _i3;

abstract class DiscordChannelEntity
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DiscordChannelEntity._({
    required this.channel,
    required this.messages,
  });

  factory DiscordChannelEntity({
    required _i2.DiscordChannel channel,
    required List<_i3.Message> messages,
  }) = _DiscordChannelEntityImpl;

  factory DiscordChannelEntity.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DiscordChannelEntity(
      channel: _i2.DiscordChannel.fromJson(
          (jsonSerialization['channel'] as Map<String, dynamic>)),
      messages: (jsonSerialization['messages'] as List)
          .map((e) => _i3.Message.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  _i2.DiscordChannel channel;

  List<_i3.Message> messages;

  /// Returns a shallow copy of this [DiscordChannelEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordChannelEntity copyWith({
    _i2.DiscordChannel? channel,
    List<_i3.Message>? messages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'channel': channel.toJson(),
      'messages': messages.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'channel': channel.toJsonForProtocol(),
      'messages': messages.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DiscordChannelEntityImpl extends DiscordChannelEntity {
  _DiscordChannelEntityImpl({
    required _i2.DiscordChannel channel,
    required List<_i3.Message> messages,
  }) : super._(
          channel: channel,
          messages: messages,
        );

  /// Returns a shallow copy of this [DiscordChannelEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordChannelEntity copyWith({
    _i2.DiscordChannel? channel,
    List<_i3.Message>? messages,
  }) {
    return DiscordChannelEntity(
      channel: channel ?? this.channel.copyWith(),
      messages: messages ?? this.messages.map((e0) => e0.copyWith()).toList(),
    );
  }
}
