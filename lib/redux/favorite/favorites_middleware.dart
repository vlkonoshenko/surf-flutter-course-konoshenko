import 'package:places/data/interactor/place_interactor.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';
import 'favorites_action.dart';

class FavoritesMiddleware implements MiddlewareClass<AppState> {
  final PlaceInteractor _placesInteractor;

  FavoritesMiddleware(this._placesInteractor);

  @override
  dynamic call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is GetFavoritesAction) {
      return store
          .dispatch(LoadedFavoritesResultAction(_placesInteractor.favorites));
    }

    if (action is AddToFavoriteAction) {
      if (_placesInteractor.favorites.contains(action.place)) {
        _placesInteractor.favorites.remove(action.place);
      } else {
        _placesInteractor.favorites.add(action.place);
      }

      return store
          .dispatch(LoadedFavoritesResultAction(_placesInteractor.favorites));
    }

    next(action);
  }
}
