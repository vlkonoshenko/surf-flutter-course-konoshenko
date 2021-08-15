import 'package:mobx/mobx.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/search_model.dart';
import 'package:places/data/repository/place_repository.dart';

part 'place_store.g.dart';

class PlaceStore = PlaceStoreBase with _$PlaceStore;

abstract class PlaceStoreBase with Store {
  final PlaceRepository _placeRepository;

  @observable
  ObservableFuture<List<Place>>? getPlacesFuture;

  PlaceStoreBase(this._placeRepository);

  @action
  void getPlaces() {
    final future = _placeRepository.getPlaceList(SearchModel());
    getPlacesFuture = ObservableFuture(future);
  }
}
