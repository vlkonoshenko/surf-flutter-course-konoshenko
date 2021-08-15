import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';

import '../../sight_card.dart';

class ListVisited extends StatefulWidget {
  final PlaceInteractor interactor;

  const ListVisited(
      this.interactor, {
        Key? key,
      }) : super(key: key);

  @override
  _ListVisitedState createState() => _ListVisitedState();
}

class _ListVisitedState extends State<ListVisited> {

  @override
  Widget build(BuildContext context) {
    return OverscrollGlowAbsorber(
      child: ListView.builder(
        physics: Platform.isAndroid
            ? const ClampingScrollPhysics()
            : const BouncingScrollPhysics(),
        itemCount: widget.interactor.visit.length,
        itemBuilder: (context, index) => DragTarget<Place>(
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            setState(() {
              final newPos = widget.interactor.visit.indexOf(widget.interactor.visit[index]);
              final dragIndex = widget.interactor.visit.indexOf(data);
              final tmp = widget.interactor.visit[index];
              widget.interactor.visit[newPos] = data;
              widget.interactor.visit[dragIndex] = tmp;
            });
          },
          builder: (context, candidate, rejected) {
            return Draggable<Place>(
              data: widget.interactor.visit[index],
              childWhenDragging: SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width - 16,
                child: SightCard(
                  widget.interactor.visit[index],
                  sightCardState: SightCardState.drag,
                  onDelete: () {
                    return;
                  },
                  onVisited: () {
                    return;
                  },
                ),
              ),
              feedback: SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width - 16,
                child: SightCard(
                  widget.interactor.visit[index],
                  sightCardState: SightCardState.drag,
                  onDelete: () {
                    return;
                  },
                  onVisited: () {
                    return;
                  },
                ),
              ),
              child: SightCard(
                widget.interactor.visit[index],
                key: ValueKey(index),
                onDelete: () {
                  return;
                },
                onVisited: () {
                  return;
                },
              ),
            );
          },
        ),
      ),
    );
  }
}