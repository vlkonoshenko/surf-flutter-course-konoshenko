import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/redux/places/places_action.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

class PlacesMiddleware implements MiddlewareClass<AppState> {
  final PlaceInteractor _placesInteractor;

  PlacesMiddleware(this._placesInteractor);

  @override
  dynamic call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is GetPlacesAction) {
      _placesInteractor.getPlaces().then<List<Place>>(
        (result) {
          store.dispatch(LoadedPlacesResultAction(result));

          return result;
        },
      );
    }

    next(action);
  }
}
