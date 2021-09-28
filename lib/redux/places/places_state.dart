import 'package:places/data/model/place.dart';

abstract class PlacesState {
  const PlacesState();
}

class PlacesInitialState extends PlacesState {
  const PlacesInitialState();
}

class PlacesLoadingState extends PlacesState {
  const PlacesLoadingState();
}

class PlacesErrorState extends PlacesState {
  const PlacesErrorState();
}

class PlacesResultState extends PlacesState {
  final List<Place> result;

  const PlacesResultState(this.result);
}
