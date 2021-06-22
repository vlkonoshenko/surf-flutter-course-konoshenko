import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/sight.dart';
import 'package:places/service/api_client.dart';

class PlaceInteractor {
  static final PlaceInteractor _singleton = PlaceInteractor._();

  factory PlaceInteractor() => _singleton;

  PlaceInteractor._();

  final favorites = <Place>[];
  final visit = <Place>[];
  final searchResult = <Place>[];

  final PlaceRepository _placeRepository =
      PlaceRepository(ApiClient().createDio());

  Future<void> searchPlaces(int radius, List<String> category) async {
    final result = await _placeRepository.getPlaceList();
    searchResult.clear();
    searchResult.addAll(result);
  }

  Future<List<Place>> getPlaces(
      RangeValues radius, List<String> category) async {
    final listResult = await _placeRepository.getPlaceList();
    final filtered = <Place>[];
    for (final element in listResult) {
      if (_arePointsNear(
        Coordinate(element.lat, element.lng),
        Coordinate(60.01693, 30.61895),
        radius,
      )) {
        filtered.add(element);
      }
    }

    return filtered;
  }

  Future<Place> getPlaceDetails(int id) => _placeRepository.getPlace(id);

  Future<void> addNewPlace(Place place) => _placeRepository.createPlace(place);

  Future<void> getFavoritesPlace() async {
    return favorites;
  }

  Future<void> addToFavorites(Place place) async {
    favorites.add(place);
  }

  Future<void> removeFromFavorites(Place place) async {
    favorites.remove(place);
  }

  Future<void> getVisitPlaces() async {
    return visit;
  }

  Future<void> addToVisitingPLaces(Place place) async {
    favorites.add(place);
  }

  Future<void> removeFromVisit(Place place) async {
    favorites.remove(place);
  }

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
