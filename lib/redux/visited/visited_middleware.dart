import 'package:places/data/interactor/place_interactor.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';
import 'visited_action.dart';

class VisitedMiddleware implements MiddlewareClass<AppState> {
  final PlaceInteractor _placesInteractor;

  VisitedMiddleware(this._placesInteractor);

  @override
  dynamic call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is GetVisitedAction) {
      store.dispatch(LoadedVisitedResultAction(_placesInteractor.visit));
    }

    next(action);
  }
}
