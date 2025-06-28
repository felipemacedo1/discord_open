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

abstract class Message implements _i1.SerializableModel {
  Message._({
    this.id,
    required this.senderInfoId,
    this.senderInfo,
    required this.content,
    required this.contentType,
    required this.timeStamp,
    required this.channelId,
    required this.isDelivered,
    required this.isDeleted,
  });

  factory Message({
    int? id,
    required int senderInfoId,
    _i2.UserInfo? senderInfo,
    required String content,
    required String contentType,
    required DateTime timeStamp,
    required int channelId,
    required bool isDelivered,
    required bool isDeleted,
  }) = _MessageImpl;

  factory Message.fromJson(Map<String, dynamic> jsonSerialization) {
    return Message(
      id: jsonSerialization['id'] as int?,
      senderInfoId: jsonSerialization['senderInfoId'] as int,
      senderInfo: jsonSerialization['senderInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['senderInfo'] as Map<String, dynamic>)),
      content: jsonSerialization['content'] as String,
      contentType: jsonSerialization['contentType'] as String,
      timeStamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timeStamp']),
      channelId: jsonSerialization['channelId'] as int,
      isDelivered: jsonSerialization['isDelivered'] as bool,
      isDeleted: jsonSerialization['isDeleted'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int senderInfoId;

  _i2.UserInfo? senderInfo;

  String content;

  String contentType;

  DateTime timeStamp;

  int channelId;

  bool isDelivered;

  bool isDeleted;

  /// Returns a shallow copy of this [Message]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Message copyWith({
    int? id,
    int? senderInfoId,
    _i2.UserInfo? senderInfo,
    String? content,
    String? contentType,
    DateTime? timeStamp,
    int? channelId,
    bool? isDelivered,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'senderInfoId': senderInfoId,
      if (senderInfo != null) 'senderInfo': senderInfo?.toJson(),
      'content': content,
      'contentType': contentType,
      'timeStamp': timeStamp.toJson(),
      'channelId': channelId,
      'isDelivered': isDelivered,
      'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MessageImpl extends Message {
  _MessageImpl({
    int? id,
    required int senderInfoId,
    _i2.UserInfo? senderInfo,
    required String content,
    required String contentType,
    required DateTime timeStamp,
    required int channelId,
    required bool isDelivered,
    required bool isDeleted,
  }) : super._(
          id: id,
          senderInfoId: senderInfoId,
          senderInfo: senderInfo,
          content: content,
          contentType: contentType,
          timeStamp: timeStamp,
          channelId: channelId,
          isDelivered: isDelivered,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [Message]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Message copyWith({
    Object? id = _Undefined,
    int? senderInfoId,
    Object? senderInfo = _Undefined,
    String? content,
    String? contentType,
    DateTime? timeStamp,
    int? channelId,
    bool? isDelivered,
    bool? isDeleted,
  }) {
    return Message(
      id: id is int? ? id : this.id,
      senderInfoId: senderInfoId ?? this.senderInfoId,
      senderInfo: senderInfo is _i2.UserInfo?
          ? senderInfo
          : this.senderInfo?.copyWith(),
      content: content ?? this.content,
      contentType: contentType ?? this.contentType,
      timeStamp: timeStamp ?? this.timeStamp,
      channelId: channelId ?? this.channelId,
      isDelivered: isDelivered ?? this.isDelivered,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
