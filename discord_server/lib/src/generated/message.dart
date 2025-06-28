/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class Message
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MessageTable();

  static const db = MessageRepository._();

  @override
  int? id;

  int senderInfoId;

  _i2.UserInfo? senderInfo;

  String content;

  String contentType;

  DateTime timeStamp;

  int channelId;

  bool isDelivered;

  bool isDeleted;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'senderInfoId': senderInfoId,
      if (senderInfo != null) 'senderInfo': senderInfo?.toJsonForProtocol(),
      'content': content,
      'contentType': contentType,
      'timeStamp': timeStamp.toJson(),
      'channelId': channelId,
      'isDelivered': isDelivered,
      'isDeleted': isDeleted,
    };
  }

  static MessageInclude include({_i2.UserInfoInclude? senderInfo}) {
    return MessageInclude._(senderInfo: senderInfo);
  }

  static MessageIncludeList includeList({
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    MessageInclude? include,
  }) {
    return MessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Message.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Message.t),
      include: include,
    );
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

class MessageTable extends _i1.Table<int?> {
  MessageTable({super.tableRelation}) : super(tableName: 'message') {
    senderInfoId = _i1.ColumnInt(
      'senderInfoId',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    contentType = _i1.ColumnString(
      'contentType',
      this,
    );
    timeStamp = _i1.ColumnDateTime(
      'timeStamp',
      this,
    );
    channelId = _i1.ColumnInt(
      'channelId',
      this,
    );
    isDelivered = _i1.ColumnBool(
      'isDelivered',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
    );
  }

  late final _i1.ColumnInt senderInfoId;

  _i2.UserInfoTable? _senderInfo;

  late final _i1.ColumnString content;

  late final _i1.ColumnString contentType;

  late final _i1.ColumnDateTime timeStamp;

  late final _i1.ColumnInt channelId;

  late final _i1.ColumnBool isDelivered;

  late final _i1.ColumnBool isDeleted;

  _i2.UserInfoTable get senderInfo {
    if (_senderInfo != null) return _senderInfo!;
    _senderInfo = _i1.createRelationTable(
      relationFieldName: 'senderInfo',
      field: Message.t.senderInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _senderInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        senderInfoId,
        content,
        contentType,
        timeStamp,
        channelId,
        isDelivered,
        isDeleted,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'senderInfo') {
      return senderInfo;
    }
    return null;
  }
}

class MessageInclude extends _i1.IncludeObject {
  MessageInclude._({_i2.UserInfoInclude? senderInfo}) {
    _senderInfo = senderInfo;
  }

  _i2.UserInfoInclude? _senderInfo;

  @override
  Map<String, _i1.Include?> get includes => {'senderInfo': _senderInfo};

  @override
  _i1.Table<int?> get table => Message.t;
}

class MessageIncludeList extends _i1.IncludeList {
  MessageIncludeList._({
    _i1.WhereExpressionBuilder<MessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Message.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Message.t;
}

class MessageRepository {
  const MessageRepository._();

  final attachRow = const MessageAttachRowRepository._();

  /// Returns a list of [Message]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Message>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.find<Message>(
      where: where?.call(Message.t),
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Message] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Message?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.findFirstRow<Message>(
      where: where?.call(Message.t),
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Message] by its [id] or null if no such row exists.
  Future<Message?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.findById<Message>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Message]s in the list and returns the inserted rows.
  ///
  /// The returned [Message]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Message>> insert(
    _i1.Session session,
    List<Message> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Message>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Message] and returns the inserted row.
  ///
  /// The returned [Message] will have its `id` field set.
  Future<Message> insertRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Message>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Message]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Message>> update(
    _i1.Session session,
    List<Message> rows, {
    _i1.ColumnSelections<MessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Message>(
      rows,
      columns: columns?.call(Message.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Message]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Message> updateRow(
    _i1.Session session,
    Message row, {
    _i1.ColumnSelections<MessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Message>(
      row,
      columns: columns?.call(Message.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Message]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Message>> delete(
    _i1.Session session,
    List<Message> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Message>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Message].
  Future<Message> deleteRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Message>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Message>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Message>(
      where: where(Message.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Message>(
      where: where?.call(Message.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MessageAttachRowRepository {
  const MessageAttachRowRepository._();

  /// Creates a relation between the given [Message] and [UserInfo]
  /// by setting the [Message]'s foreign key `senderInfoId` to refer to the [UserInfo].
  Future<void> senderInfo(
    _i1.Session session,
    Message message,
    _i2.UserInfo senderInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }
    if (senderInfo.id == null) {
      throw ArgumentError.notNull('senderInfo.id');
    }

    var $message = message.copyWith(senderInfoId: senderInfo.id);
    await session.db.updateRow<Message>(
      $message,
      columns: [Message.t.senderInfoId],
      transaction: transaction,
    );
  }
}
