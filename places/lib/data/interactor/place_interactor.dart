import 'package:flutter/cupertino.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/service/api_client.dart';

class PlaceInteractor extends ChangeNotifier {
  static final PlaceInteractor _singleton = PlaceInteractor._();

  factory PlaceInteractor() {
    return _singleton;
  }

  PlaceInteractor._();

  final favorites = <Place>{};
  final visit = <Place>{};

  final PlaceRepository _placeRepository =
      PlaceRepository(ApiClient().createDio());

  Future<List<Place>> getPlaces(int radius, List<String> category) =>
      _placeRepository.getPlaceList();

  Future<Place> getPlaceDetails(int id) => _placeRepository.getPlace(id);

  Future<void> addNewPlace(Place place) => _placeRepository.createPlace(place);

  Future<void> getFavoritesPlace() async {
    return favorites;
  }

  Future<void> addToFavorites(Place place) async {
    favorites.add(place);
    notifyListeners();
  }

  Future<void> removeFromFavorites(Place place) async {
    favorites.remove(place);
    notifyListeners();
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
}
