import 'package:places/redux/setting/setting_state.dart';

import 'search/search_state.dart';

class AppState {
  final SearchState searchState;
  final SettingState settingState;

  AppState({
    SearchState? searchState,
    SettingState? settingState,
  })  : searchState = searchState ?? const SearchInitialState(),
        settingState = settingState ?? const SettingState(isDarkMode: false);

  AppState copyWith({
    SearchState? searchState,
    SettingState? settingState,
  }) =>
      AppState(
        searchState: searchState ?? this.searchState,
        settingState: settingState ?? this.settingState,
      );
}
