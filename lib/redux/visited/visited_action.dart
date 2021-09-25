import 'package:places/data/model/place.dart';

abstract class VisitedAction {}

class LoadedVisitedResultAction extends VisitedAction {
  final List<Place> result;

  LoadedVisitedResultAction(this.result);
}

class GetVisitedAction extends VisitedAction {}

class GetVisitedErrorAction extends VisitedAction {}
