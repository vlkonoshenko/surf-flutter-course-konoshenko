import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/bloc/visited_list/visited_list_bloc.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';
import 'package:provider/provider.dart';

import '../../sight_card.dart';

class ListVisited extends StatefulWidget {
  const ListVisited({
    Key? key,
  }) : super(key: key);

  @override
  _ListVisitedState createState() => _ListVisitedState();
}

class _ListVisitedState extends State<ListVisited> {
  late final VisitedListBloc visitedBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitedListBloc, VisitedListState>(
      bloc: visitedBloc,
      builder: (context, state) {
        if (state is VisitedListData) {
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
                        context.read<VisitedListBloc>().add(
                              VisitedListRemove(
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
    visitedBloc = context.read<VisitedListBloc>();
    visitedBloc.add(FavoritesListLoad());
  }
}
