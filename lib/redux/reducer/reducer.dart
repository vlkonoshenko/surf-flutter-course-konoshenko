import 'package:places/redux/action/search_action.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';
import 'search_reducer.dart';

final reducer = combineReducers<AppState>([
  TypedReducer<AppState, GetSearchResultAction>(getSearchResultReducer),
  TypedReducer<AppState, LoadedSearchResultAction>(loadedSearchResultReducer),
  TypedReducer<AppState, GetSearchHistoryAction>(getSearchHistoryReducer),
  TypedReducer<AppState, LoadedSearchHistoryAction>(loadedSearchHistoryReducer),
  TypedReducer<AppState, RemoveRequestFromHistoryAction>(
    removeRequestFromHistoryReducer,
  ),
  TypedReducer<AppState, ClearHistorySearchAction>(clearHistorySearchReducer),
]);
