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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'enums/activity_status.dart' as _i3;
import 'server_membership.dart' as _i4;

abstract class DiscordUser implements _i1.SerializableModel {
  DiscordUser._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.status,
    this.members,
  });

  factory DiscordUser({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required _i3.ActivityStatus status,
    List<_i4.ServerMembership>? members,
  }) = _DiscordUserImpl;

  factory DiscordUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiscordUser(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      status: _i3.ActivityStatus.fromJson((jsonSerialization['status'] as int)),
      members: (jsonSerialization['members'] as List?)
          ?.map(
              (e) => _i4.ServerMembership.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  _i3.ActivityStatus status;

  List<_i4.ServerMembership>? members;

  /// Returns a shallow copy of this [DiscordUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordUser copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    _i3.ActivityStatus? status,
    List<_i4.ServerMembership>? members,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'status': status.toJson(),
      if (members != null)
        'members': members?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiscordUserImpl extends DiscordUser {
  _DiscordUserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required _i3.ActivityStatus status,
    List<_i4.ServerMembership>? members,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          status: status,
          members: members,
        );

  /// Returns a shallow copy of this [DiscordUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordUser copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    _i3.ActivityStatus? status,
    Object? members = _Undefined,
  }) {
    return DiscordUser(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      status: status ?? this.status,
      members: members is List<_i4.ServerMembership>?
          ? members
          : this.members?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
