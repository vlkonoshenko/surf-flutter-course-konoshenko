import 'package:places/data/model/place.dart';

abstract class FavoritesState {
  final List<Place> result;

  const FavoritesState({this.result = const []});
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
  const FavoritesResultState(List<Place> result) : super(result: result);
}
