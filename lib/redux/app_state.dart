import 'package:places/redux/places/places_state.dart';
import 'package:places/redux/setting/setting_state.dart';

import 'search/search_state.dart';

class AppState {
  final SearchState searchState;
  final SettingState settingState;
  final PlacesState placesState;

  AppState({
    SearchState? searchState,
    SettingState? settingState,
    PlacesState? placesState,
  })  : searchState = searchState ?? const SearchInitialState(),
        settingState = settingState ?? const SettingState(isDarkMode: false),
        placesState = placesState ?? const PlacesInitialState();

  AppState copyWith({
    SearchState? searchState,
    SettingState? settingState,
    PlacesState? placesState,
  }) =>
      AppState(
        searchState: searchState ?? this.searchState,
        settingState: settingState ?? this.settingState,
        placesState: placesState ?? this.placesState,
      );
}
