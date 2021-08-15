import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/data/model/coordinate.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/search_model.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/service/api_client.dart';

class SearchInteractor {
  static final SearchInteractor _singleton = SearchInteractor._();

  final history = <String>[];
  final filteredList = <Place>[];

  final PlaceRepository _placeRepository =
      PlaceRepository(ApiClient().createDio());

  factory SearchInteractor() => _singleton;

  SearchInteractor._();

  Future<List<Place>> searchPlaces(
    String text,
    RangeValues radius,
  ) async {
    final listResult = await _placeRepository.getPlaceList(SearchModel());
    filteredList.clear();
    for (final element in listResult) {
      if (_arePointsNear(
            Coordinate(element.lat, element.lng),
            const Coordinate(60.01693, 30.61895),
            radius,
          ) &&
          element.name.toLowerCase().contains(text.toLowerCase())) {
        filteredList.add(element);
      }
    }

    return filteredList;
  }

  void cleanHistory() => history.clear();

  bool _arePointsNear(
    Coordinate checkPoint,
    Coordinate centerPoint,
    RangeValues range,
  ) {
    final kmH = range.end / 1000;
    final kmL = range.start / 1000;
    const ky = 40000 / 360;
    final kx = cos(pi * centerPoint.lat / 180.0) * ky;
    final dx = (centerPoint.lng - checkPoint.lng).abs() * kx;
    final dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
    final distance = sqrt(dx * dx + dy * dy);
    final result = distance <= kmH && distance >= kmL;

    return result;
  }
}
