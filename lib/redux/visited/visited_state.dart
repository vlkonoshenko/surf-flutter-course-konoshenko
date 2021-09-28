import 'package:places/data/model/place.dart';

abstract class VisitedState {
  const VisitedState();
}

class VisitedInitialState extends VisitedState {
  const VisitedInitialState();
}

class VisitedLoadingState extends VisitedState {
  const VisitedLoadingState();
}

class VisitedErrorState extends VisitedState {
  const VisitedErrorState();
}

class VisitedResultState extends VisitedState {
  final List<Place> result;

  const VisitedResultState(this.result);
}


