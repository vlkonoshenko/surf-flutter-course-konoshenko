import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

part 'visited_list_event.dart';

part 'visited_list_state.dart';

class VisitedListBloc extends Bloc<VisitedListEvent, VisitedListState> {
  final PlaceRepository _placeRepository;

  VisitedListBloc(this._placeRepository) : super(VisitedListData(const {}));

  @override
  Stream<VisitedListState> mapEventToState(
    VisitedListEvent event,
  ) async* {
    if (event is FavoritesListLoad) {
      yield* _loadFavorites(event);
    }
    if (event is VisitedListAdd) {
      yield* _addToVisited(event);
    }
    if (event is VisitedListRemove) {
      yield* _removeFromVisited(event);
    }
  }

  Stream<VisitedListState> _loadFavorites(FavoritesListLoad _) async* {
    yield VisitedListLoading();
    await Future<void>.delayed(const Duration(seconds: 2));
    yield VisitedListData(_placeRepository.visited);
  }

  Stream<VisitedListState> _addToVisited(VisitedListAdd event) async* {
    _placeRepository.favorites.add(event.place);
    yield VisitedListData(_placeRepository.visited);
  }

  Stream<VisitedListData> _removeFromVisited(
    VisitedListRemove event,
  ) async* {
    _placeRepository.favorites.remove(event.place);
    yield VisitedListData(_placeRepository.visited);
  }
}
