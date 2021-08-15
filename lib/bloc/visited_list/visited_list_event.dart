part of 'visited_list_bloc.dart';

@immutable
abstract class VisitedListEvent {}

class FavoritesListLoad extends VisitedListEvent {}

class VisitedListAdd extends VisitedListEvent {
  final Place place;

  VisitedListAdd(this.place);
}

class VisitedListRemove extends VisitedListEvent {
  final Place place;

  VisitedListRemove(this.place);
}
