import 'state/search_state.dart';

class AppState {
  final SearchState searchState;

  AppState({
    SearchState? searchState,
  }) : searchState = searchState ?? const SearchInitialState();

  AppState copyWith({SearchState? searchState}) =>
      AppState(searchState: searchState ?? this.searchState);
}
