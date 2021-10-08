import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places/data/database/utils/place_converter.dart';
import 'package:places/data/model/place.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [SearchRequests, TablePlaces, Favorites])
class MoorDatabase extends _$MoorDatabase {
  @override
  int get schemaVersion =>2;

  Future<List<SearchRequest>> get allTodoEntries =>
      select(searchRequests).get();

  MoorDatabase() : super(_openConnection());

  Future<int> addRequest(SearchRequestsCompanion entry) {
    return into(searchRequests).insert(entry);
  }

  Future<void> addToFavorites(Place place) =>
      into(favorites).insertOnConflictUpdate(FavoritesCompanion(
        placeId: Value(place.id),
        place: Value(place),
      ));

  Future<void> removeFromFavorites(Place place) =>
      (delete(favorites)..where((row) => row.placeId.equals(place.id)))
          .go();

  Future<void> updateFavoritesPlace(Place place) =>
      update(favorites).replace(FavoritesCompanion(
        placeId: Value(place.id),
        place: Value(place),
      ));

  Future<Favorite> getFavoritesItem(int id) =>
      (select(favorites)..where((row) => row.placeId.equals(id))).getSingle();


  Future<void> removeRequest() async{
    delete(searchRequests).go();
  }
}

class SearchRequests extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get request => text().withLength(max: 32)();
}

class Favorites extends Table {
  IntColumn get placeId => integer()();

  TextColumn get place =>
      text().map( PlaceConverter()).nullable()();

  @override
  Set<Column>? get primaryKey => {placeId};
}

class TablePlaces extends Table {
  IntColumn get placeId => integer()();

  TextColumn get place =>
      text().map( PlaceConverter()).nullable()();

  @override
  Set<Column>? get primaryKey => {placeId};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));

    return VmDatabase(file);
  });
}
