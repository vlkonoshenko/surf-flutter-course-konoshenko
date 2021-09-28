import 'package:places/redux/app_state.dart';

import 'visited_action.dart';
import 'visited_state.dart';

AppState getVisitedAction(
  AppState state,
  GetVisitedAction _,
) =>
    state.copyWith(visitedState: const VisitedLoadingState());

AppState loadedVisitedResultAction(
  AppState state,
  LoadedVisitedResultAction action,
) =>
    state.copyWith(visitedState: VisitedResultState(action.result));

AppState getVisitedErrorAction(
  AppState state,
  GetVisitedErrorAction _,
) =>
    state.copyWith(visitedState: const VisitedErrorState());
