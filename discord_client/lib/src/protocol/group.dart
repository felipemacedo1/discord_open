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

abstract class Group implements _i1.SerializableModel {
  Group._({
    this.id,
    required this.name,
    required this.discordServerId,
    required this.type,
  });

  factory Group({
    int? id,
    required String name,
    required int discordServerId,
    required _i2.GroupType type,
  }) = _GroupImpl;

  factory Group.fromJson(Map<String, dynamic> jsonSerialization) {
    return Group(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      discordServerId: jsonSerialization['discordServerId'] as int,
      type: _i2.GroupType.fromJson((jsonSerialization['type'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int discordServerId;

  _i2.GroupType type;

  /// Returns a shallow copy of this [Group]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Group copyWith({
    int? id,
    String? name,
    int? discordServerId,
    _i2.GroupType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
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

class _GroupImpl extends Group {
  _GroupImpl({
    int? id,
    required String name,
    required int discordServerId,
    required _i2.GroupType type,
  }) : super._(
          id: id,
          name: name,
          discordServerId: discordServerId,
          type: type,
        );

  /// Returns a shallow copy of this [Group]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Group copyWith({
    Object? id = _Undefined,
    String? name,
    int? discordServerId,
    _i2.GroupType? type,
  }) {
    return Group(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      discordServerId: discordServerId ?? this.discordServerId,
      type: type ?? this.type,
    );
  }
}
