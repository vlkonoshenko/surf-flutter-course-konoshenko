import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/bloc/favorites_list/favorites_list_bloc.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';
import 'package:provider/provider.dart';

import '../../sight_card.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  late final FavoritesListBloc favoriteBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesListBloc, FavoritesListState>(
      bloc: favoriteBloc,
      builder: (context, state) {
        if (state is FavoritesListData) {
          return OverscrollGlowAbsorber(
            child: ListView.builder(
              physics: Platform.isAndroid
                  ? const ClampingScrollPhysics()
                  : const BouncingScrollPhysics(),
              itemCount: state.places.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 120,
                  height: 200,
                  child: SightCard(
                    state.places.elementAt(index),
                    key: ObjectKey(state.places.elementAt(index)),
                    onDelete: () {
                      setState(() {
                        context.read<FavoritesListBloc>().add(
                              FavoritesListRemove(
                                state.places.elementAt(index),
                              ),
                            );
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

  @override
  void initState() {
    super.initState();
    favoriteBloc = context.read<FavoritesListBloc>();
    favoriteBloc.add(FavoritesListLoad());
  }
}
