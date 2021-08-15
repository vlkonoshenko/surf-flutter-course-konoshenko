import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

part 'favorites_list_event.dart';
part 'favorites_list_state.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  final PlaceRepository _favoritesRepository;

  FavoritesListBloc(this._favoritesRepository)
      : super(FavoritesListData(const {}));

  @override
  Stream<FavoritesListState> mapEventToState(
    FavoritesListEvent event,
  ) async* {
    if (event is FavoritesListLoad) {
      yield* _loadFavorites(event);
    }
    if (event is FavoritesListAdd) {
      yield* _addToFavorites(event);
    }
    if (event is FavoritesListRemove) {
      yield* _removeFromFavorites(event);
    }
  }

  Stream<FavoritesListState> _loadFavorites(FavoritesListLoad _) async* {
    yield FavoritesLoading();
    await Future<void>.delayed(const Duration(seconds: 2));
    yield FavoritesListData(_favoritesRepository.favorites);
  }

  Stream<FavoritesListState> _addToFavorites(FavoritesListAdd event) async* {
    _favoritesRepository.favorites.add(event.place);
    yield FavoritesListData(_favoritesRepository.favorites);
  }

  Stream<FavoritesListState> _removeFromFavorites(
    FavoritesListRemove event,
  ) async* {
    _favoritesRepository.favorites.remove(event.place);
    yield FavoritesListData(_favoritesRepository.favorites);
  }
}
