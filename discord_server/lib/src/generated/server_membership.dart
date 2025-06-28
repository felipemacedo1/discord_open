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
import 'discord_user.dart' as _i2;

abstract class ServerMembership
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ServerMembership._({
    this.id,
    required this.userId,
    required this.serverId,
    required this.discordUserId,
    this.discordUser,
  }) : _discordUserMembersDiscordUserId = null;

  factory ServerMembership({
    int? id,
    required int userId,
    required int serverId,
    required int discordUserId,
    _i2.DiscordUser? discordUser,
  }) = _ServerMembershipImpl;

  factory ServerMembership.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerMembershipImplicit._(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      serverId: jsonSerialization['serverId'] as int,
      discordUserId: jsonSerialization['discordUserId'] as int,
      discordUser: jsonSerialization['discordUser'] == null
          ? null
          : _i2.DiscordUser.fromJson(
              (jsonSerialization['discordUser'] as Map<String, dynamic>)),
      $_discordUserMembersDiscordUserId:
          jsonSerialization['_discordUserMembersDiscordUserId'] as int?,
    );
  }

  static final t = ServerMembershipTable();

  static const db = ServerMembershipRepository._();

  @override
  int? id;

  int userId;

  int serverId;

  int discordUserId;

  _i2.DiscordUser? discordUser;

  final int? _discordUserMembersDiscordUserId;

  @override
  _i1.Table<int?> get table => t;

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
      if (_discordUserMembersDiscordUserId != null)
        '_discordUserMembersDiscordUserId': _discordUserMembersDiscordUserId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'serverId': serverId,
      'discordUserId': discordUserId,
      if (discordUser != null) 'discordUser': discordUser?.toJsonForProtocol(),
    };
  }

  static ServerMembershipInclude include(
      {_i2.DiscordUserInclude? discordUser}) {
    return ServerMembershipInclude._(discordUser: discordUser);
  }

  static ServerMembershipIncludeList includeList({
    _i1.WhereExpressionBuilder<ServerMembershipTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServerMembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServerMembershipTable>? orderByList,
    ServerMembershipInclude? include,
  }) {
    return ServerMembershipIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ServerMembership.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ServerMembership.t),
      include: include,
    );
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
    return ServerMembershipImplicit._(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      serverId: serverId ?? this.serverId,
      discordUserId: discordUserId ?? this.discordUserId,
      discordUser: discordUser is _i2.DiscordUser?
          ? discordUser
          : this.discordUser?.copyWith(),
      $_discordUserMembersDiscordUserId: this._discordUserMembersDiscordUserId,
    );
  }
}

class ServerMembershipImplicit extends _ServerMembershipImpl {
  ServerMembershipImplicit._({
    int? id,
    required int userId,
    required int serverId,
    required int discordUserId,
    _i2.DiscordUser? discordUser,
    int? $_discordUserMembersDiscordUserId,
  })  : _discordUserMembersDiscordUserId = $_discordUserMembersDiscordUserId,
        super(
          id: id,
          userId: userId,
          serverId: serverId,
          discordUserId: discordUserId,
          discordUser: discordUser,
        );

  factory ServerMembershipImplicit(
    ServerMembership serverMembership, {
    int? $_discordUserMembersDiscordUserId,
  }) {
    return ServerMembershipImplicit._(
      id: serverMembership.id,
      userId: serverMembership.userId,
      serverId: serverMembership.serverId,
      discordUserId: serverMembership.discordUserId,
      discordUser: serverMembership.discordUser,
      $_discordUserMembersDiscordUserId: $_discordUserMembersDiscordUserId,
    );
  }

  @override
  final int? _discordUserMembersDiscordUserId;
}

class ServerMembershipTable extends _i1.Table<int?> {
  ServerMembershipTable({super.tableRelation})
      : super(tableName: 'server_membership') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    serverId = _i1.ColumnInt(
      'serverId',
      this,
    );
    discordUserId = _i1.ColumnInt(
      'discordUserId',
      this,
    );
    $_discordUserMembersDiscordUserId = _i1.ColumnInt(
      '_discordUserMembersDiscordUserId',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt serverId;

  late final _i1.ColumnInt discordUserId;

  _i2.DiscordUserTable? _discordUser;

  late final _i1.ColumnInt $_discordUserMembersDiscordUserId;

  _i2.DiscordUserTable get discordUser {
    if (_discordUser != null) return _discordUser!;
    _discordUser = _i1.createRelationTable(
      relationFieldName: 'discordUser',
      field: ServerMembership.t.discordUserId,
      foreignField: _i2.DiscordUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DiscordUserTable(tableRelation: foreignTableRelation),
    );
    return _discordUser!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        serverId,
        discordUserId,
        $_discordUserMembersDiscordUserId,
      ];

  @override
  List<_i1.Column> get managedColumns => [
        id,
        userId,
        serverId,
        discordUserId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'discordUser') {
      return discordUser;
    }
    return null;
  }
}

class ServerMembershipInclude extends _i1.IncludeObject {
  ServerMembershipInclude._({_i2.DiscordUserInclude? discordUser}) {
    _discordUser = discordUser;
  }

  _i2.DiscordUserInclude? _discordUser;

  @override
  Map<String, _i1.Include?> get includes => {'discordUser': _discordUser};

  @override
  _i1.Table<int?> get table => ServerMembership.t;
}

class ServerMembershipIncludeList extends _i1.IncludeList {
  ServerMembershipIncludeList._({
    _i1.WhereExpressionBuilder<ServerMembershipTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ServerMembership.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ServerMembership.t;
}

class ServerMembershipRepository {
  const ServerMembershipRepository._();

  final attachRow = const ServerMembershipAttachRowRepository._();

  /// Returns a list of [ServerMembership]s matching the given query parameters.
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
  Future<List<ServerMembership>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServerMembershipTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServerMembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServerMembershipTable>? orderByList,
    _i1.Transaction? transaction,
    ServerMembershipInclude? include,
  }) async {
    return session.db.find<ServerMembership>(
      where: where?.call(ServerMembership.t),
      orderBy: orderBy?.call(ServerMembership.t),
      orderByList: orderByList?.call(ServerMembership.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ServerMembership] matching the given query parameters.
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
  Future<ServerMembership?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServerMembershipTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServerMembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServerMembershipTable>? orderByList,
    _i1.Transaction? transaction,
    ServerMembershipInclude? include,
  }) async {
    return session.db.findFirstRow<ServerMembership>(
      where: where?.call(ServerMembership.t),
      orderBy: orderBy?.call(ServerMembership.t),
      orderByList: orderByList?.call(ServerMembership.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ServerMembership] by its [id] or null if no such row exists.
  Future<ServerMembership?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ServerMembershipInclude? include,
  }) async {
    return session.db.findById<ServerMembership>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ServerMembership]s in the list and returns the inserted rows.
  ///
  /// The returned [ServerMembership]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ServerMembership>> insert(
    _i1.Session session,
    List<ServerMembership> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ServerMembership>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ServerMembership] and returns the inserted row.
  ///
  /// The returned [ServerMembership] will have its `id` field set.
  Future<ServerMembership> insertRow(
    _i1.Session session,
    ServerMembership row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ServerMembership>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ServerMembership]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ServerMembership>> update(
    _i1.Session session,
    List<ServerMembership> rows, {
    _i1.ColumnSelections<ServerMembershipTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ServerMembership>(
      rows,
      columns: columns?.call(ServerMembership.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ServerMembership]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ServerMembership> updateRow(
    _i1.Session session,
    ServerMembership row, {
    _i1.ColumnSelections<ServerMembershipTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ServerMembership>(
      row,
      columns: columns?.call(ServerMembership.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ServerMembership]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ServerMembership>> delete(
    _i1.Session session,
    List<ServerMembership> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServerMembership>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ServerMembership].
  Future<ServerMembership> deleteRow(
    _i1.Session session,
    ServerMembership row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ServerMembership>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ServerMembership>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServerMembershipTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ServerMembership>(
      where: where(ServerMembership.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServerMembershipTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServerMembership>(
      where: where?.call(ServerMembership.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ServerMembershipAttachRowRepository {
  const ServerMembershipAttachRowRepository._();

  /// Creates a relation between the given [ServerMembership] and [DiscordUser]
  /// by setting the [ServerMembership]'s foreign key `discordUserId` to refer to the [DiscordUser].
  Future<void> discordUser(
    _i1.Session session,
    ServerMembership serverMembership,
    _i2.DiscordUser discordUser, {
    _i1.Transaction? transaction,
  }) async {
    if (serverMembership.id == null) {
      throw ArgumentError.notNull('serverMembership.id');
    }
    if (discordUser.id == null) {
      throw ArgumentError.notNull('discordUser.id');
    }

    var $serverMembership =
        serverMembership.copyWith(discordUserId: discordUser.id);
    await session.db.updateRow<ServerMembership>(
      $serverMembership,
      columns: [ServerMembership.t.discordUserId],
      transaction: transaction,
    );
  }
}
