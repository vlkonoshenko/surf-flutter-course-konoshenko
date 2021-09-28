import 'package:places/redux/app_state.dart';
import 'package:places/redux/places/places_action.dart';
import 'package:places/redux/places/places_state.dart';

AppState getPlacesAction(
  AppState state,
  GetPlacesAction _,
) =>
    state.copyWith(placesState: const PlacesLoadingState());

AppState loadedPlacesResultAction(
  AppState state,
  LoadedPlacesResultAction action,
) =>
    state.copyWith(placesState: PlacesResultState(action.result));

AppState getPlacesErrorAction(
  AppState state,
  GetPlacesErrorAction _,
) =>
    state.copyWith(placesState: const PlacesErrorState());
