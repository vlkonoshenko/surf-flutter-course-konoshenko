import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

part 'favorites_list_event.dart';

part 'visited_list_state.dart';

class VisitedListBloc extends Bloc<FavoritesListEvent, VisitedListState> {
  final PlaceRepository _favoritesRepository;

  VisitedListBloc(this._favoritesRepository) : super(VisitedListData(const {}));

  @override
  Stream<VisitedListState> mapEventToState(
    FavoritesListEvent event,
  ) async* {
    if (event is FavoritesListLoad) {
      yield* _loadFavorites(event);
    }
    if (event is FavoritesListAdd) {
      yield* _addToVisited(event);
    }
    if (event is FavoritesListRemove) {
      yield* _removeFromVisited(event);
    }
  }

  Stream<VisitedListState> _loadFavorites(FavoritesListLoad _) async* {
    yield VisitedListLoading();
    await Future<void>.delayed(const Duration(seconds: 2));
    yield VisitedListData(_favoritesRepository.visited);
  }

  Stream<VisitedListState> _addToVisited(FavoritesListAdd event) async* {
    _favoritesRepository.favorites.add(event.place);
    yield VisitedListData(_favoritesRepository.visited);
  }

  Stream<VisitedListData> _removeFromVisited(
    FavoritesListRemove event,
  ) async* {
    _favoritesRepository.favorites.remove(event.place);
    yield VisitedListData(_favoritesRepository.visited);
  }
}
