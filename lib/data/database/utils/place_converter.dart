import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:places/data/model/place.dart';

class PlaceConverter extends TypeConverter<Place, String> {
   PlaceConverter();

  @override
  Place? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Place.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(Place? value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
