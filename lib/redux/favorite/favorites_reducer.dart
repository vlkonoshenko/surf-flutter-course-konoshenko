import 'package:places/redux/app_state.dart';

import 'favorites_action.dart';
import 'favorites_state.dart';

AppState getFavoritesAction(
  AppState state,
  GetFavoritesAction _,
) =>
    state.copyWith(favoritesState: const FavoritesLoadingState());

AppState loadedFavoritesResultAction(
  AppState state,
  LoadedFavoritesResultAction action,
) =>
    state.copyWith(favoritesState: FavoritesResultState(action.result));

AppState getFavoritesErrorAction(
  AppState state,
  GetFavoritesErrorAction _,
) =>
    state.copyWith(favoritesState: const FavoritesErrorState());
