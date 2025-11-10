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

abstract class DiscordServer
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DiscordServerTable();

  static const db = DiscordServerRepository._();

  @override
  int? id;

  String name;

  int newMessagesCount;

  int newMessagesChats;

  String serverBackground;

  int? defaultChannelId;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'newMessagesCount': newMessagesCount,
      'newMessagesChats': newMessagesChats,
      'serverBackground': serverBackground,
      if (defaultChannelId != null) 'defaultChannelId': defaultChannelId,
    };
  }

  static DiscordServerInclude include() {
    return DiscordServerInclude._();
  }

  static DiscordServerIncludeList includeList({
    _i1.WhereExpressionBuilder<DiscordServerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiscordServerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordServerTable>? orderByList,
    DiscordServerInclude? include,
  }) {
    return DiscordServerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DiscordServer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DiscordServer.t),
      include: include,
    );
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

class DiscordServerTable extends _i1.Table<int?> {
  DiscordServerTable({super.tableRelation})
      : super(tableName: 'discord_server') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    newMessagesCount = _i1.ColumnInt(
      'newMessagesCount',
      this,
    );
    newMessagesChats = _i1.ColumnInt(
      'newMessagesChats',
      this,
    );
    serverBackground = _i1.ColumnString(
      'serverBackground',
      this,
    );
    defaultChannelId = _i1.ColumnInt(
      'defaultChannelId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt newMessagesCount;

  late final _i1.ColumnInt newMessagesChats;

  late final _i1.ColumnString serverBackground;

  late final _i1.ColumnInt defaultChannelId;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        newMessagesCount,
        newMessagesChats,
        serverBackground,
        defaultChannelId,
      ];
}

class DiscordServerInclude extends _i1.IncludeObject {
  DiscordServerInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DiscordServer.t;
}

class DiscordServerIncludeList extends _i1.IncludeList {
  DiscordServerIncludeList._({
    _i1.WhereExpressionBuilder<DiscordServerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DiscordServer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DiscordServer.t;
}

class DiscordServerRepository {
  const DiscordServerRepository._();

  /// Returns a list of [DiscordServer]s matching the given query parameters.
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
  Future<List<DiscordServer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordServerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiscordServerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordServerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DiscordServer>(
      where: where?.call(DiscordServer.t),
      orderBy: orderBy?.call(DiscordServer.t),
      orderByList: orderByList?.call(DiscordServer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DiscordServer] matching the given query parameters.
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
  Future<DiscordServer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordServerTable>? where,
    int? offset,
    _i1.OrderByBuilder<DiscordServerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordServerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DiscordServer>(
      where: where?.call(DiscordServer.t),
      orderBy: orderBy?.call(DiscordServer.t),
      orderByList: orderByList?.call(DiscordServer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DiscordServer] by its [id] or null if no such row exists.
  Future<DiscordServer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DiscordServer>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DiscordServer]s in the list and returns the inserted rows.
  ///
  /// The returned [DiscordServer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DiscordServer>> insert(
    _i1.Session session,
    List<DiscordServer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DiscordServer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DiscordServer] and returns the inserted row.
  ///
  /// The returned [DiscordServer] will have its `id` field set.
  Future<DiscordServer> insertRow(
    _i1.Session session,
    DiscordServer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DiscordServer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DiscordServer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DiscordServer>> update(
    _i1.Session session,
    List<DiscordServer> rows, {
    _i1.ColumnSelections<DiscordServerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DiscordServer>(
      rows,
      columns: columns?.call(DiscordServer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DiscordServer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DiscordServer> updateRow(
    _i1.Session session,
    DiscordServer row, {
    _i1.ColumnSelections<DiscordServerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DiscordServer>(
      row,
      columns: columns?.call(DiscordServer.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DiscordServer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DiscordServer>> delete(
    _i1.Session session,
    List<DiscordServer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DiscordServer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DiscordServer].
  Future<DiscordServer> deleteRow(
    _i1.Session session,
    DiscordServer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DiscordServer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DiscordServer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DiscordServerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DiscordServer>(
      where: where(DiscordServer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordServerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DiscordServer>(
      where: where?.call(DiscordServer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
