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

abstract class DiscordChannel
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DiscordChannel._({
    this.id,
    required this.name,
    required this.icon,
    required this.groupId,
    required this.discordServerId,
    required this.type,
  });

  factory DiscordChannel({
    int? id,
    required String name,
    required String icon,
    required int groupId,
    required int discordServerId,
    required _i2.GroupType type,
  }) = _DiscordChannelImpl;

  factory DiscordChannel.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiscordChannel(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      icon: jsonSerialization['icon'] as String,
      groupId: jsonSerialization['groupId'] as int,
      discordServerId: jsonSerialization['discordServerId'] as int,
      type: _i2.GroupType.fromJson((jsonSerialization['type'] as int)),
    );
  }

  static final t = DiscordChannelTable();

  static const db = DiscordChannelRepository._();

  @override
  int? id;

  String name;

  String icon;

  int groupId;

  int discordServerId;

  _i2.GroupType type;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DiscordChannel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiscordChannel copyWith({
    int? id,
    String? name,
    String? icon,
    int? groupId,
    int? discordServerId,
    _i2.GroupType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'icon': icon,
      'groupId': groupId,
      'discordServerId': discordServerId,
      'type': type.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'icon': icon,
      'groupId': groupId,
      'discordServerId': discordServerId,
      'type': type.toJson(),
    };
  }

  static DiscordChannelInclude include() {
    return DiscordChannelInclude._();
  }

  static DiscordChannelIncludeList includeList({
    _i1.WhereExpressionBuilder<DiscordChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiscordChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordChannelTable>? orderByList,
    DiscordChannelInclude? include,
  }) {
    return DiscordChannelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DiscordChannel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DiscordChannel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiscordChannelImpl extends DiscordChannel {
  _DiscordChannelImpl({
    int? id,
    required String name,
    required String icon,
    required int groupId,
    required int discordServerId,
    required _i2.GroupType type,
  }) : super._(
          id: id,
          name: name,
          icon: icon,
          groupId: groupId,
          discordServerId: discordServerId,
          type: type,
        );

  /// Returns a shallow copy of this [DiscordChannel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiscordChannel copyWith({
    Object? id = _Undefined,
    String? name,
    String? icon,
    int? groupId,
    int? discordServerId,
    _i2.GroupType? type,
  }) {
    return DiscordChannel(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      groupId: groupId ?? this.groupId,
      discordServerId: discordServerId ?? this.discordServerId,
      type: type ?? this.type,
    );
  }
}

class DiscordChannelTable extends _i1.Table<int?> {
  DiscordChannelTable({super.tableRelation})
      : super(tableName: 'discord_channel') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
    groupId = _i1.ColumnInt(
      'groupId',
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

  late final _i1.ColumnString icon;

  late final _i1.ColumnInt groupId;

  late final _i1.ColumnInt discordServerId;

  late final _i1.ColumnEnum<_i2.GroupType> type;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        icon,
        groupId,
        discordServerId,
        type,
      ];
}

class DiscordChannelInclude extends _i1.IncludeObject {
  DiscordChannelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DiscordChannel.t;
}

class DiscordChannelIncludeList extends _i1.IncludeList {
  DiscordChannelIncludeList._({
    _i1.WhereExpressionBuilder<DiscordChannelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DiscordChannel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DiscordChannel.t;
}

class DiscordChannelRepository {
  const DiscordChannelRepository._();

  /// Returns a list of [DiscordChannel]s matching the given query parameters.
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
  Future<List<DiscordChannel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiscordChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordChannelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DiscordChannel>(
      where: where?.call(DiscordChannel.t),
      orderBy: orderBy?.call(DiscordChannel.t),
      orderByList: orderByList?.call(DiscordChannel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DiscordChannel] matching the given query parameters.
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
  Future<DiscordChannel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordChannelTable>? where,
    int? offset,
    _i1.OrderByBuilder<DiscordChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiscordChannelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DiscordChannel>(
      where: where?.call(DiscordChannel.t),
      orderBy: orderBy?.call(DiscordChannel.t),
      orderByList: orderByList?.call(DiscordChannel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DiscordChannel] by its [id] or null if no such row exists.
  Future<DiscordChannel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DiscordChannel>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DiscordChannel]s in the list and returns the inserted rows.
  ///
  /// The returned [DiscordChannel]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DiscordChannel>> insert(
    _i1.Session session,
    List<DiscordChannel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DiscordChannel>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DiscordChannel] and returns the inserted row.
  ///
  /// The returned [DiscordChannel] will have its `id` field set.
  Future<DiscordChannel> insertRow(
    _i1.Session session,
    DiscordChannel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DiscordChannel>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DiscordChannel]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DiscordChannel>> update(
    _i1.Session session,
    List<DiscordChannel> rows, {
    _i1.ColumnSelections<DiscordChannelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DiscordChannel>(
      rows,
      columns: columns?.call(DiscordChannel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DiscordChannel]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DiscordChannel> updateRow(
    _i1.Session session,
    DiscordChannel row, {
    _i1.ColumnSelections<DiscordChannelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DiscordChannel>(
      row,
      columns: columns?.call(DiscordChannel.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DiscordChannel]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DiscordChannel>> delete(
    _i1.Session session,
    List<DiscordChannel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DiscordChannel>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DiscordChannel].
  Future<DiscordChannel> deleteRow(
    _i1.Session session,
    DiscordChannel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DiscordChannel>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DiscordChannel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DiscordChannelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DiscordChannel>(
      where: where(DiscordChannel.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiscordChannelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DiscordChannel>(
      where: where?.call(DiscordChannel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
