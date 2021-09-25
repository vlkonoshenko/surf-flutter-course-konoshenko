import 'package:places/redux/places/places_action.dart';
import 'package:places/redux/places/places_reducer.dart';
import 'package:places/redux/search/search_action.dart';
import 'package:places/redux/search/search_reducer.dart';
import 'package:places/redux/setting/setting_action.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'favorite/favorites_action.dart';
import 'favorite/favorites_reducer.dart';
import 'setting/setting_reducer.dart';

final reducer = combineReducers<AppState>([
  TypedReducer<AppState, GetSearchResultAction>(getSearchResultReducer),
  TypedReducer<AppState, LoadedSearchResultAction>(loadedSearchResultReducer),
  TypedReducer<AppState, GetSearchHistoryAction>(getSearchHistoryReducer),
  TypedReducer<AppState, LoadedSearchHistoryAction>(loadedSearchHistoryReducer),
  TypedReducer<AppState, RemoveRequestFromHistoryAction>(
    removeRequestFromHistoryReducer,
  ),
  TypedReducer<AppState, ClearHistorySearchAction>(clearHistorySearchReducer),
  TypedReducer<AppState, SwitchThemeAction>(getSwitchThemeReducer),
  //Places
  TypedReducer<AppState, LoadedPlacesResultAction>(loadedPlacesResultAction),
  TypedReducer<AppState, GetPlacesErrorAction>(getPlacesErrorAction),
  TypedReducer<AppState, GetPlacesAction>(getPlacesAction),
  //Favorites
  TypedReducer<AppState, LoadedFavoritesResultAction>(loadedFavoritesResultAction),
  TypedReducer<AppState, GetFavoritesErrorAction>(getFavoritesErrorAction),
  TypedReducer<AppState, GetFavoritesAction>(getFavoritesAction),
]);
