import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

class SearchMiddleware implements MiddlewareClass<AppState> {
  final SearchInteractor _searchInteractor;

  SearchMiddleware(this._searchInteractor);

  @override
  dynamic call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is GetSearchResultAction) {
      _searchInteractor
          .searchPlaces(action.search, const RangeValues(0, 10000))
          .then<List<Place>>(
        (result) {
          store.dispatch(LoadedSearchResultAction(result));

          return result;
        },
      );
    } else if (action is GetSearchHistoryAction) {
      store.dispatch(LoadedSearchHistoryAction(_searchInteractor.history));
    } else if (action is RemoveRequestFromHistoryAction) {
      _searchInteractor.removeItem(action.index);
      store.dispatch(GetSearchHistoryAction());
    } else if (action is ClearHistorySearchAction) {
      _searchInteractor.cleanHistory();
      store.dispatch(GetSearchHistoryAction());
    }

    next(action);
  }
}
