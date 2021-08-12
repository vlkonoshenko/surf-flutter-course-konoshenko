import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Избранное',
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1!
                .copyWith(fontSize: 18),
          ),
        ),
        body: Column(
          children:  [
            const _TabBarScreen(),
            Expanded(
              child: TabBarView(
                children: [
                  const ListWantVisit(),
                  ListVisited(context.read<PlaceInteractor>()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarScreen extends StatelessWidget {
  const _TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: const TabBar(
        tabs: [
          Tab(text: 'Хочу посетить'),
          Tab(text: 'Посетил'),
        ],
      ),
    );
  }
}

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
                ),
              ),
              child: SightCard(
                widget.interactor.visit[index],
                key: ValueKey(index),
                onDelete: () {
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

class ListWantVisit extends StatefulWidget {
  const ListWantVisit({
    Key? key,
  }) : super(key: key);

  @override
  _ListWantVisitState createState() => _ListWantVisitState();
}

class _ListWantVisitState extends State<ListWantVisit> {
  late final PlaceInteractor interactor;

  @override
  Widget build(BuildContext context) {
    return OverscrollGlowAbsorber(
      child: ListView.builder(
        physics: Platform.isAndroid
            ? const ClampingScrollPhysics()
            : const BouncingScrollPhysics(),
        itemCount: interactor.favorites.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 120,
            height: 120,
            child: SightCard(
              interactor.favorites.elementAt(index),
              key: ObjectKey(interactor.favorites.elementAt(index)),
              onDelete: () {
                setState(() {
                  interactor.favorites
                      .remove(interactor.favorites.elementAt(index));
                });
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    interactor = context.read<PlaceInteractor>();
  }
}
