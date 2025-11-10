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
import 'enums/group_type.dart' as _i2;

abstract class Group implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = GroupTable();

  static const db = GroupRepository._();

  @override
  int? id;

  String name;

  int discordServerId;

  _i2.GroupType type;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'discordServerId': discordServerId,
      'type': type.toJson(),
    };
  }

  static GroupInclude include() {
    return GroupInclude._();
  }

  static GroupIncludeList includeList({
    _i1.WhereExpressionBuilder<GroupTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GroupTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GroupTable>? orderByList,
    GroupInclude? include,
  }) {
    return GroupIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Group.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Group.t),
      include: include,
    );
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

class GroupTable extends _i1.Table<int?> {
  GroupTable({super.tableRelation}) : super(tableName: 'group') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    discordServerId = _i1.ColumnInt(
      'discordServerId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byIndex,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt discordServerId;

  late final _i1.ColumnEnum<_i2.GroupType> type;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        discordServerId,
        type,
      ];
}

class GroupInclude extends _i1.IncludeObject {
  GroupInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Group.t;
}

class GroupIncludeList extends _i1.IncludeList {
  GroupIncludeList._({
    _i1.WhereExpressionBuilder<GroupTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Group.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Group.t;
}

class GroupRepository {
  const GroupRepository._();

  /// Returns a list of [Group]s matching the given query parameters.
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
  Future<List<Group>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GroupTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GroupTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GroupTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Group>(
      where: where?.call(Group.t),
      orderBy: orderBy?.call(Group.t),
      orderByList: orderByList?.call(Group.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Group] matching the given query parameters.
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
  Future<Group?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GroupTable>? where,
    int? offset,
    _i1.OrderByBuilder<GroupTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GroupTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Group>(
      where: where?.call(Group.t),
      orderBy: orderBy?.call(Group.t),
      orderByList: orderByList?.call(Group.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Group] by its [id] or null if no such row exists.
  Future<Group?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Group>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Group]s in the list and returns the inserted rows.
  ///
  /// The returned [Group]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Group>> insert(
    _i1.Session session,
    List<Group> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Group>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Group] and returns the inserted row.
  ///
  /// The returned [Group] will have its `id` field set.
  Future<Group> insertRow(
    _i1.Session session,
    Group row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Group>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Group]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Group>> update(
    _i1.Session session,
    List<Group> rows, {
    _i1.ColumnSelections<GroupTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Group>(
      rows,
      columns: columns?.call(Group.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Group]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Group> updateRow(
    _i1.Session session,
    Group row, {
    _i1.ColumnSelections<GroupTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Group>(
      row,
      columns: columns?.call(Group.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Group]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Group>> delete(
    _i1.Session session,
    List<Group> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Group>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Group].
  Future<Group> deleteRow(
    _i1.Session session,
    Group row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Group>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Group>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GroupTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Group>(
      where: where(Group.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GroupTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Group>(
      where: where?.call(Group.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
