import 'package:places/data/model/place.dart';

abstract class PlacesState {
  final List<Place> result;
  const PlacesState(this.result);
}

class PlacesInitialState extends PlacesState {
  const PlacesInitialState():super(const []);
}

class PlacesLoadingState extends PlacesState {
  const PlacesLoadingState():super(const []);
}

class PlacesErrorState extends PlacesState {
  const PlacesErrorState():super(const []);
}

class PlacesResultState extends PlacesState {

  const PlacesResultState(List<Place> result):super(result);
}
