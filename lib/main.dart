import 'package:flutter/widgets.dart';
import 'package:places/redux/reducer.dart';
import 'package:places/redux/search/search_middleware.dart';
import 'package:redux/redux.dart';

import 'app/app.dart';
import 'data/interactor/search_interactor.dart';
import 'redux/app_state.dart';

void main() {
  runApp(App(_createStore()));
}

Store<AppState> _createStore() {
  return Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: [
      SearchMiddleware(SearchInteractor()),
    ],
  );
}
