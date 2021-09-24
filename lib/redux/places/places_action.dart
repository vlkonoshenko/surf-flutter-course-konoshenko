import 'package:places/data/model/place.dart';

abstract class PlacesAction {}

class LoadedPlacesResultAction extends PlacesAction {
  final List<Place> result;

  LoadedPlacesResultAction(this.result);
}

class GetPlacesAction extends PlacesAction {}

class GetPlacesErrorAction extends PlacesAction {}
