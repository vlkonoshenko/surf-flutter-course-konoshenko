part of 'favorites_list_bloc.dart';

@immutable
abstract class FavoritesListEvent {}

class FavoritesListLoad extends FavoritesListEvent {}

class FavoritesListAdd extends FavoritesListEvent {
  final Place place;

  FavoritesListAdd(this.place);
}

class FavoritesListRemove extends FavoritesListEvent {
  final Place place;

  FavoritesListRemove(this.place);
}
