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
import 'enums/activity_status.dart' as _i3;
import 'server_membership.dart' as _i4;

abstract class DiscordUser
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DiscordUserTable();

  static const db = DiscordUserRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  _i3.ActivityStatus status;

  List<_i4.ServerMembership>? members;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'status': status.toJson(),
      if (members != null)
        'members': members?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static DiscordUserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i4.ServerMembershipIncludeList? members,
  }) {
    return DiscordUserInclude._(
      userInfo: userInfo,
      members: members,
    );
  }

  static DiscordUserIncludeList includeList({
    _i1.WhereExpressionBuilder<DiscordUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiscordUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordUserTable>? orderByList,
    DiscordUserInclude? include,
  }) {
    return DiscordUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DiscordUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DiscordUser.t),
      include: include,
    );
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

class DiscordUserTable extends _i1.Table<int?> {
  DiscordUserTable({super.tableRelation}) : super(tableName: 'discord_user') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnEnum<_i3.ActivityStatus> status;

  _i4.ServerMembershipTable? ___members;

  _i1.ManyRelation<_i4.ServerMembershipTable>? _members;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: DiscordUser.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i4.ServerMembershipTable get __members {
    if (___members != null) return ___members!;
    ___members = _i1.createRelationTable(
      relationFieldName: '__members',
      field: DiscordUser.t.id,
      foreignField: _i4.ServerMembership.t.$_discordUserMembersDiscordUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ServerMembershipTable(tableRelation: foreignTableRelation),
    );
    return ___members!;
  }

  _i1.ManyRelation<_i4.ServerMembershipTable> get members {
    if (_members != null) return _members!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'members',
      field: DiscordUser.t.id,
      foreignField: _i4.ServerMembership.t.$_discordUserMembersDiscordUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ServerMembershipTable(tableRelation: foreignTableRelation),
    );
    _members = _i1.ManyRelation<_i4.ServerMembershipTable>(
      tableWithRelations: relationTable,
      table: _i4.ServerMembershipTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _members!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        status,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'members') {
      return __members;
    }
    return null;
  }
}

class DiscordUserInclude extends _i1.IncludeObject {
  DiscordUserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i4.ServerMembershipIncludeList? members,
  }) {
    _userInfo = userInfo;
    _members = members;
  }

  _i2.UserInfoInclude? _userInfo;

  _i4.ServerMembershipIncludeList? _members;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'members': _members,
      };

  @override
  _i1.Table<int?> get table => DiscordUser.t;
}

class DiscordUserIncludeList extends _i1.IncludeList {
  DiscordUserIncludeList._({
    _i1.WhereExpressionBuilder<DiscordUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DiscordUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DiscordUser.t;
}

class DiscordUserRepository {
  const DiscordUserRepository._();

  final attach = const DiscordUserAttachRepository._();

  final attachRow = const DiscordUserAttachRowRepository._();

  final detach = const DiscordUserDetachRepository._();

  final detachRow = const DiscordUserDetachRowRepository._();

  /// Returns a list of [DiscordUser]s matching the given query parameters.
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
  Future<List<DiscordUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiscordUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordUserTable>? orderByList,
    _i1.Transaction? transaction,
    DiscordUserInclude? include,
  }) async {
    return session.db.find<DiscordUser>(
      where: where?.call(DiscordUser.t),
      orderBy: orderBy?.call(DiscordUser.t),
      orderByList: orderByList?.call(DiscordUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DiscordUser] matching the given query parameters.
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
  Future<DiscordUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<DiscordUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordUserTable>? orderByList,
    _i1.Transaction? transaction,
    DiscordUserInclude? include,
  }) async {
    return session.db.findFirstRow<DiscordUser>(
      where: where?.call(DiscordUser.t),
      orderBy: orderBy?.call(DiscordUser.t),
      orderByList: orderByList?.call(DiscordUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DiscordUser] by its [id] or null if no such row exists.
  Future<DiscordUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DiscordUserInclude? include,
  }) async {
    return session.db.findById<DiscordUser>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DiscordUser]s in the list and returns the inserted rows.
  ///
  /// The returned [DiscordUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DiscordUser>> insert(
    _i1.Session session,
    List<DiscordUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DiscordUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DiscordUser] and returns the inserted row.
  ///
  /// The returned [DiscordUser] will have its `id` field set.
  Future<DiscordUser> insertRow(
    _i1.Session session,
    DiscordUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DiscordUser>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DiscordUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DiscordUser>> update(
    _i1.Session session,
    List<DiscordUser> rows, {
    _i1.ColumnSelections<DiscordUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DiscordUser>(
      rows,
      columns: columns?.call(DiscordUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DiscordUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DiscordUser> updateRow(
    _i1.Session session,
    DiscordUser row, {
    _i1.ColumnSelections<DiscordUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DiscordUser>(
      row,
      columns: columns?.call(DiscordUser.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DiscordUser]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DiscordUser>> delete(
    _i1.Session session,
    List<DiscordUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DiscordUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DiscordUser].
  Future<DiscordUser> deleteRow(
    _i1.Session session,
    DiscordUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DiscordUser>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DiscordUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DiscordUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DiscordUser>(
      where: where(DiscordUser.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DiscordUser>(
      where: where?.call(DiscordUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DiscordUserAttachRepository {
  const DiscordUserAttachRepository._();

  /// Creates a relation between this [DiscordUser] and the given [ServerMembership]s
  /// by setting each [ServerMembership]'s foreign key `_discordUserMembersDiscordUserId` to refer to this [DiscordUser].
  Future<void> members(
    _i1.Session session,
    DiscordUser discordUser,
    List<_i4.ServerMembership> serverMembership, {
    _i1.Transaction? transaction,
  }) async {
    if (serverMembership.any((e) => e.id == null)) {
      throw ArgumentError.notNull('serverMembership.id');
    }
    if (discordUser.id == null) {
      throw ArgumentError.notNull('discordUser.id');
    }

    var $serverMembership = serverMembership
        .map((e) => _i4.ServerMembershipImplicit(
              e,
              $_discordUserMembersDiscordUserId: discordUser.id,
            ))
        .toList();
    await session.db.update<_i4.ServerMembership>(
      $serverMembership,
      columns: [_i4.ServerMembership.t.$_discordUserMembersDiscordUserId],
      transaction: transaction,
    );
  }
}

class DiscordUserAttachRowRepository {
  const DiscordUserAttachRowRepository._();

  /// Creates a relation between the given [DiscordUser] and [UserInfo]
  /// by setting the [DiscordUser]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    DiscordUser discordUser,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (discordUser.id == null) {
      throw ArgumentError.notNull('discordUser.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $discordUser = discordUser.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<DiscordUser>(
      $discordUser,
      columns: [DiscordUser.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [DiscordUser] and the given [ServerMembership]
  /// by setting the [ServerMembership]'s foreign key `_discordUserMembersDiscordUserId` to refer to this [DiscordUser].
  Future<void> members(
    _i1.Session session,
    DiscordUser discordUser,
    _i4.ServerMembership serverMembership, {
    _i1.Transaction? transaction,
  }) async {
    if (serverMembership.id == null) {
      throw ArgumentError.notNull('serverMembership.id');
    }
    if (discordUser.id == null) {
      throw ArgumentError.notNull('discordUser.id');
    }

    var $serverMembership = _i4.ServerMembershipImplicit(
      serverMembership,
      $_discordUserMembersDiscordUserId: discordUser.id,
    );
    await session.db.updateRow<_i4.ServerMembership>(
      $serverMembership,
      columns: [_i4.ServerMembership.t.$_discordUserMembersDiscordUserId],
      transaction: transaction,
    );
  }
}

class DiscordUserDetachRepository {
  const DiscordUserDetachRepository._();

  /// Detaches the relation between this [DiscordUser] and the given [ServerMembership]
  /// by setting the [ServerMembership]'s foreign key `_discordUserMembersDiscordUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> members(
    _i1.Session session,
    List<_i4.ServerMembership> serverMembership, {
    _i1.Transaction? transaction,
  }) async {
    if (serverMembership.any((e) => e.id == null)) {
      throw ArgumentError.notNull('serverMembership.id');
    }

    var $serverMembership = serverMembership
        .map((e) => _i4.ServerMembershipImplicit(
              e,
              $_discordUserMembersDiscordUserId: null,
            ))
        .toList();
    await session.db.update<_i4.ServerMembership>(
      $serverMembership,
      columns: [_i4.ServerMembership.t.$_discordUserMembersDiscordUserId],
      transaction: transaction,
    );
  }
}

class DiscordUserDetachRowRepository {
  const DiscordUserDetachRowRepository._();

  /// Detaches the relation between this [DiscordUser] and the given [ServerMembership]
  /// by setting the [ServerMembership]'s foreign key `_discordUserMembersDiscordUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> members(
    _i1.Session session,
    _i4.ServerMembership serverMembership, {
    _i1.Transaction? transaction,
  }) async {
    if (serverMembership.id == null) {
      throw ArgumentError.notNull('serverMembership.id');
    }

    var $serverMembership = _i4.ServerMembershipImplicit(
      serverMembership,
      $_discordUserMembersDiscordUserId: null,
    );
    await session.db.updateRow<_i4.ServerMembership>(
      $serverMembership,
      columns: [_i4.ServerMembership.t.$_discordUserMembersDiscordUserId],
      transaction: transaction,
    );
  }
}
