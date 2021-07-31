import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/service/api_client.dart';

class PlaceInteractor {
  static final PlaceInteractor _singleton = PlaceInteractor._();

  final favorites = <Place>[];
  final visit = <Place>[];
  final searchResult = <Place>[];

  final PlaceRepository _placeRepository =
      PlaceRepository(ApiClient().createDio());

  factory PlaceInteractor() => _singleton;

  PlaceInteractor._();

  Future<void> searchPlaces(int radius, List<String> category) async {
    final result = await _placeRepository.getPlaceList();
    searchResult
      ..clear()
      ..addAll(result);
  }

  Future<List<Place>> getPlaces(
    RangeValues radius,
    List<String> category,
  ) async {
    return _placeRepository.getPlaceList();
  }

  Future<Place> getPlaceDetails(int id) => _placeRepository.getPlace(id);

  Future<void> addNewPlace(Place place) => _placeRepository.createPlace(place);

  Future<List<Place>> getFavoritesPlace() async {
    return favorites;
  }

  Future<void> addToFavorites(Place place) async {
    favorites.add(place);
  }

  Future<void> removeFromFavorites(Place place) async {
    favorites.remove(place);
  }

  Future<List<Place>> getVisitPlaces() async {
    return visit;
  }

  Future<void> addToVisitingPLaces(Place place) async {
    favorites.add(place);
  }

  Future<void> removeFromVisit(Place place) async {
    favorites.remove(place);
  }
}
