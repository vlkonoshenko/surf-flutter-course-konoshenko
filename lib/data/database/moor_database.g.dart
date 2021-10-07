// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SearchRequest extends DataClass implements Insertable<SearchRequest> {
  final int id;
  final String request;
  SearchRequest({required this.id, required this.request});
  factory SearchRequest.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SearchRequest(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      request: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}request'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['request'] = Variable<String>(request);
    return map;
  }

  SearchRequestsCompanion toCompanion(bool nullToAbsent) {
    return SearchRequestsCompanion(
      id: Value(id),
      request: Value(request),
    );
  }

  factory SearchRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SearchRequest(
      id: serializer.fromJson<int>(json['id']),
      request: serializer.fromJson<String>(json['request']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'request': serializer.toJson<String>(request),
    };
  }

  SearchRequest copyWith({int? id, String? request}) => SearchRequest(
        id: id ?? this.id,
        request: request ?? this.request,
      );
  @override
  String toString() {
    return (StringBuffer('SearchRequest(')
          ..write('id: $id, ')
          ..write('request: $request')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, request.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchRequest &&
          other.id == this.id &&
          other.request == this.request);
}

class SearchRequestsCompanion extends UpdateCompanion<SearchRequest> {
  final Value<int> id;
  final Value<String> request;
  const SearchRequestsCompanion({
    this.id = const Value.absent(),
    this.request = const Value.absent(),
  });
  SearchRequestsCompanion.insert({
    this.id = const Value.absent(),
    required String request,
  }) : request = Value(request);
  static Insertable<SearchRequest> custom({
    Expression<int>? id,
    Expression<String>? request,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (request != null) 'request': request,
    });
  }

  SearchRequestsCompanion copyWith({Value<int>? id, Value<String>? request}) {
    return SearchRequestsCompanion(
      id: id ?? this.id,
      request: request ?? this.request,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (request.present) {
      map['request'] = Variable<String>(request.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchRequestsCompanion(')
          ..write('id: $id, ')
          ..write('request: $request')
          ..write(')'))
        .toString();
  }
}

class $SearchRequestsTable extends SearchRequests
    with TableInfo<$SearchRequestsTable, SearchRequest> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SearchRequestsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _requestMeta = const VerificationMeta('request');
  late final GeneratedColumn<String?> request = GeneratedColumn<String?>(
      'request', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, request];
  @override
  String get aliasedName => _alias ?? 'search_requests';
  @override
  String get actualTableName => 'search_requests';
  @override
  VerificationContext validateIntegrity(Insertable<SearchRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('request')) {
      context.handle(_requestMeta,
          request.isAcceptableOrUnknown(data['request']!, _requestMeta));
    } else if (isInserting) {
      context.missing(_requestMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SearchRequest.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SearchRequestsTable createAlias(String alias) {
    return $SearchRequestsTable(_db, alias);
  }
}

class TablePlace extends DataClass implements Insertable<TablePlace> {
  final int placeId;
  final Place? place;
  TablePlace({required this.placeId, this.place});
  factory TablePlace.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TablePlace(
      placeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}place_id'])!,
      place: $TablePlacesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}place'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['place_id'] = Variable<int>(placeId);
    if (!nullToAbsent || place != null) {
      final converter = $TablePlacesTable.$converter0;
      map['place'] = Variable<String?>(converter.mapToSql(place));
    }
    return map;
  }

  TablePlacesCompanion toCompanion(bool nullToAbsent) {
    return TablePlacesCompanion(
      placeId: Value(placeId),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
    );
  }

  factory TablePlace.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TablePlace(
      placeId: serializer.fromJson<int>(json['placeId']),
      place: serializer.fromJson<Place?>(json['place']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'placeId': serializer.toJson<int>(placeId),
      'place': serializer.toJson<Place?>(place),
    };
  }

  TablePlace copyWith({int? placeId, Place? place}) => TablePlace(
        placeId: placeId ?? this.placeId,
        place: place ?? this.place,
      );
  @override
  String toString() {
    return (StringBuffer('TablePlace(')
          ..write('placeId: $placeId, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(placeId.hashCode, place.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TablePlace &&
          other.placeId == this.placeId &&
          other.place == this.place);
}

class TablePlacesCompanion extends UpdateCompanion<TablePlace> {
  final Value<int> placeId;
  final Value<Place?> place;
  const TablePlacesCompanion({
    this.placeId = const Value.absent(),
    this.place = const Value.absent(),
  });
  TablePlacesCompanion.insert({
    this.placeId = const Value.absent(),
    this.place = const Value.absent(),
  });
  static Insertable<TablePlace> custom({
    Expression<int>? placeId,
    Expression<Place?>? place,
  }) {
    return RawValuesInsertable({
      if (placeId != null) 'place_id': placeId,
      if (place != null) 'place': place,
    });
  }

  TablePlacesCompanion copyWith({Value<int>? placeId, Value<Place?>? place}) {
    return TablePlacesCompanion(
      placeId: placeId ?? this.placeId,
      place: place ?? this.place,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (place.present) {
      final converter = $TablePlacesTable.$converter0;
      map['place'] = Variable<String?>(converter.mapToSql(place.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TablePlacesCompanion(')
          ..write('placeId: $placeId, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }
}

class $TablePlacesTable extends TablePlaces
    with TableInfo<$TablePlacesTable, TablePlace> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TablePlacesTable(this._db, [this._alias]);
  final VerificationMeta _placeIdMeta = const VerificationMeta('placeId');
  late final GeneratedColumn<int?> placeId = GeneratedColumn<int?>(
      'place_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  late final GeneratedColumnWithTypeConverter<Place, String?> place =
      GeneratedColumn<String?>('place', aliasedName, true,
              typeName: 'TEXT', requiredDuringInsert: false)
          .withConverter<Place>($TablePlacesTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [placeId, place];
  @override
  String get aliasedName => _alias ?? 'table_places';
  @override
  String get actualTableName => 'table_places';
  @override
  VerificationContext validateIntegrity(Insertable<TablePlace> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('place_id')) {
      context.handle(_placeIdMeta,
          placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta));
    }
    context.handle(_placeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {placeId};
  @override
  TablePlace map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TablePlace.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TablePlacesTable createAlias(String alias) {
    return $TablePlacesTable(_db, alias);
  }

  static TypeConverter<Place, String> $converter0 = PlaceConverter();
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int placeId;
  final Place? place;
  Favorite({required this.placeId, this.place});
  factory Favorite.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Favorite(
      placeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}place_id'])!,
      place: $FavoritesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}place'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['place_id'] = Variable<int>(placeId);
    if (!nullToAbsent || place != null) {
      final converter = $FavoritesTable.$converter0;
      map['place'] = Variable<String?>(converter.mapToSql(place));
    }
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      placeId: Value(placeId),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Favorite(
      placeId: serializer.fromJson<int>(json['placeId']),
      place: serializer.fromJson<Place?>(json['place']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'placeId': serializer.toJson<int>(placeId),
      'place': serializer.toJson<Place?>(place),
    };
  }

  Favorite copyWith({int? placeId, Place? place}) => Favorite(
        placeId: placeId ?? this.placeId,
        place: place ?? this.place,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('placeId: $placeId, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(placeId.hashCode, place.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.placeId == this.placeId &&
          other.place == this.place);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> placeId;
  final Value<Place?> place;
  const FavoritesCompanion({
    this.placeId = const Value.absent(),
    this.place = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.placeId = const Value.absent(),
    this.place = const Value.absent(),
  });
  static Insertable<Favorite> custom({
    Expression<int>? placeId,
    Expression<Place?>? place,
  }) {
    return RawValuesInsertable({
      if (placeId != null) 'place_id': placeId,
      if (place != null) 'place': place,
    });
  }

  FavoritesCompanion copyWith({Value<int>? placeId, Value<Place?>? place}) {
    return FavoritesCompanion(
      placeId: placeId ?? this.placeId,
      place: place ?? this.place,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (place.present) {
      final converter = $FavoritesTable.$converter0;
      map['place'] = Variable<String?>(converter.mapToSql(place.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('placeId: $placeId, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _placeIdMeta = const VerificationMeta('placeId');
  late final GeneratedColumn<int?> placeId = GeneratedColumn<int?>(
      'place_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  late final GeneratedColumnWithTypeConverter<Place, String?> place =
      GeneratedColumn<String?>('place', aliasedName, true,
              typeName: 'TEXT', requiredDuringInsert: false)
          .withConverter<Place>($FavoritesTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [placeId, place];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('place_id')) {
      context.handle(_placeIdMeta,
          placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta));
    }
    context.handle(_placeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {placeId};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Favorite.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }

  static TypeConverter<Place, String> $converter0 = PlaceConverter();
}

abstract class _$MoorDatabase extends GeneratedDatabase {
  _$MoorDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SearchRequestsTable searchRequests = $SearchRequestsTable(this);
  late final $TablePlacesTable tablePlaces = $TablePlacesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [searchRequests, tablePlaces, favorites];
}
