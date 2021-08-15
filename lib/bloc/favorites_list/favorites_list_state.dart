part of 'favorites_list_bloc.dart';

@immutable
abstract class FavoritesListState extends Equatable {}

class FavoritesListData extends FavoritesListState {
  final Set<Place> places;

  @override
  List<Object?> get props => [places];

  FavoritesListData(this.places);
}

class FavoritesLoading extends FavoritesListState {
  @override
  List<Object?> get props => [];
}
