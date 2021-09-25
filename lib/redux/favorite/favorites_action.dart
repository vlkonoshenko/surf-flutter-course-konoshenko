import 'package:places/data/model/place.dart';

abstract class FavoritesAction {}

class LoadedFavoritesResultAction extends FavoritesAction {
  final List<Place> result;

  LoadedFavoritesResultAction(this.result);
}

class GetFavoritesAction extends FavoritesAction {}

class GetFavoritesErrorAction extends FavoritesAction {}
