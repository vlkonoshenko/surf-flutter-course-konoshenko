import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/overscroll_glow_absorber.dart';
import 'package:places/ui/screen/sight_card.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key key}) : super(key: key);

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
                  .subtitle1
                  .copyWith(fontSize: 18),
            ),
          ),
          body: Column(
            children: [
              _tabBar(context),
              const Expanded(
                child: TabBarView(
                  children: [
                    ListWantVisit(),
                    ListVisited(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Container _tabBar(BuildContext context) {
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
  const ListVisited({
    Key key,
  }) : super(key: key);

  @override
  _ListVisitedState createState() => _ListVisitedState();
}

class _ListVisitedState extends State<ListVisited> {
  List<SightCardMeta> list =
      visit.map((e) => e.copyWith(visited: true)).toList();

  @override
  Widget build(BuildContext context) {
    return OverscrollGlowAbsorber(
      child: ListView.builder(
        physics: Platform.isAndroid
            ? const ClampingScrollPhysics()
            : const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => DragTarget<SightCardMeta>(
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            setState(() {
              final newPos = list.indexOf(list[index]);
              final dragIndex = list.indexOf(data);
              final tmp = list[index];
              list[newPos] = data;
              list[dragIndex] = tmp;
            });
          },
          builder: (context, candidate, rejected) {
            return Draggable<SightCardMeta>(
              data: list[index],
              childWhenDragging: SizedBox(
                  height: 240,
                  width: MediaQuery.of(context).size.width - 16,
                  child: SightCard(
                    list[index],
                    sightCardState: SightCardState.drag,
                  )),
              feedback: SizedBox(
                  height: 240,
                  width: MediaQuery.of(context).size.width - 16,
                  child: SightCard(
                    list[index],
                    sightCardState: SightCardState.drag,
                  )),
              child: SightCard(
                list[index],
                key: ValueKey(index),
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
    Key key,
  }) : super(key: key);

  @override
  _ListWantVisitState createState() => _ListWantVisitState();
}

class _ListWantVisitState extends State<ListWantVisit> {
  @override
  Widget build(BuildContext context) {
    return OverscrollGlowAbsorber(
      child: ListView.builder(
          physics: Platform.isAndroid
              ? const ClampingScrollPhysics()
              : const BouncingScrollPhysics(),
          itemCount: visit.length,
          itemBuilder: (context, index) {
            return SightCard(
              visit[index],
              key: ObjectKey(visit[index]),
              onDelete: () {
                visit.removeAt(index);
                setState(() {});
              },
            );
          }),
    );
  }
}
