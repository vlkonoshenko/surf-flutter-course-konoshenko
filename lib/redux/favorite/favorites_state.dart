import 'package:places/data/model/place.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitialState extends FavoritesState {
  const FavoritesInitialState();
}

class FavoritesLoadingState extends FavoritesState {
  const FavoritesLoadingState();
}

class FavoritesErrorState extends FavoritesState {
  const FavoritesErrorState();
}

class FavoritesResultState extends FavoritesState {
  final List<Place> result;

  const FavoritesResultState(this.result);
}


