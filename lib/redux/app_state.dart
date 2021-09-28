import 'package:places/redux/places/places_state.dart';
import 'package:places/redux/setting/setting_state.dart';

import 'favorite/favorites_state.dart';
import 'search/search_state.dart';
import 'visited/visited_state.dart';

class AppState {
  final SearchState searchState;
  final SettingState settingState;
  final PlacesState placesState;
  final FavoritesState favoritesState;
  final VisitedState visitedState;

  AppState({
    SearchState? searchState,
    SettingState? settingState,
    FavoritesState? favoritesState,
    VisitedState? visitedState,
    PlacesState? placesState,
  })  : searchState = searchState ?? const SearchInitialState(),
        settingState = settingState ?? const SettingState(isDarkMode: false),
        placesState = placesState ?? const PlacesInitialState(),
        favoritesState = favoritesState ?? const FavoritesInitialState(),
        visitedState = visitedState ?? const VisitedInitialState();

  AppState copyWith({
    SearchState? searchState,
    SettingState? settingState,
    PlacesState? placesState,
    FavoritesState? favoritesState,
    VisitedState? visitedState,
  }) =>
      AppState(
        searchState: searchState ?? this.searchState,
        settingState: settingState ?? this.settingState,
        placesState: placesState ?? this.placesState,
        favoritesState: favoritesState ?? this.favoritesState,
        visitedState: visitedState ?? this.visitedState,
      );
}
