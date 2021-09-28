import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/visited/visited_action.dart';
import 'package:places/redux/visited/visited_state.dart';
import 'package:places/ui/components/circle_progress_loader.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';

import '../../sight_card.dart';

class ListVisited extends StatefulWidget {
  const ListVisited({
    Key? key,
  }) : super(key: key);

  @override
  _ListVisitedState createState() => _ListVisitedState();
}

class _ListVisitedState extends State<ListVisited> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VisitedState>(
      onInit: (store) => store.dispatch(GetVisitedAction()),
      converter: (store) => store.state.visitedState,
      builder: (context, state) {
        if (state is VisitedResultState) {
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
                      //Add remove
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

        return const Center(child: CircleProgressLoader());
      },
    );
  }
}
