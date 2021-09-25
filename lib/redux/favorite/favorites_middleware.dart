import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';
import 'favorites_action.dart';

class FavoritesMiddleware implements MiddlewareClass<AppState> {
  final PlaceInteractor _placesInteractor;

  FavoritesMiddleware(this._placesInteractor);

  @override
  dynamic call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is GetFavoritesAction) {
      _placesInteractor.getFavoritesPlace().then<List<Place>>(
        (result) {
          store.dispatch(LoadedFavoritesResultAction(result));

          return result;
        },
      );
    }

    next(action);
  }
}
