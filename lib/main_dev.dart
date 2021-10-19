import 'package:flutter/widgets.dart';
import 'package:places/redux/favorite/favorites_middleware.dart';
import 'package:places/redux/places/places_middleware.dart';
import 'package:places/redux/reducer.dart';
import 'package:places/redux/search/search_middleware.dart';
import 'package:redux/redux.dart';

import 'app/app.dart';
import 'data/interactor/place_interactor.dart';
import 'data/interactor/search_interactor.dart';
import 'environment/config.dart';
import 'environment/environment.dart';
import 'environment/environment_type.dart';
import 'redux/app_state.dart';
import 'redux/visited/visited_middleware.dart';

void main() {
  Environment.init(
    buildType: EnvironmentType.debug,
    config: Config(),
  );
  runApp(App(_createStore()));
}

Store<AppState> _createStore() {
  return Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: [
      SearchMiddleware(SearchInteractor()),
      PlacesMiddleware(PlaceInteractor()),
      FavoritesMiddleware(PlaceInteractor()),
      VisitedMiddleware(PlaceInteractor()),
    ],
  );
}
