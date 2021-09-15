import 'package:flutter/widgets.dart';
import 'package:places/redux/reducer/reducer.dart';
import 'package:redux/redux.dart';

import 'app.dart';
import 'data/interactor/search_interactor.dart';
import 'redux/app_state.dart';
import 'redux/middleware/search_middleware.dart';

void main() {
  final store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: [
      SearchMiddleware(SearchInteractor()),
    ],
  );

  runApp(App(store));
}
