import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/favorite/favorites_action.dart';
import 'package:places/redux/favorite/favorites_state.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';

import '../../sight_card.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavoritesState>(
      onInit: (store) => store.dispatch(GetFavoritesAction()),
      converter: (store) => store.state.favoritesState,
      builder: (context, state) {

        if (state is FavoritesResultState) {
          return OverscrollGlowAbsorber(
            child: ListView.builder(
              physics: Platform.isAndroid
                  ? const ClampingScrollPhysics()
                  : const BouncingScrollPhysics(),
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 120,
                  height: 200,
                  child: SightCard(
                    state.result.elementAt(index),
                    key: ObjectKey(state.result.elementAt(index)),
                    onDelete: () {
                      setState(() {
                        // Add remove from favorite list
                      });
                    },
                    onVisited: () {
                      return;
                    },
                  ),
                );
              },
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
