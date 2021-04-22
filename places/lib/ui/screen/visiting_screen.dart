import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';

import '../../mocks.dart';

class VisitingScreen extends StatefulWidget {
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
              "Избранное",
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1
                  .copyWith(fontSize: 18),
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Хочу посетить'),
                    Tab(text: 'Посетил'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [ListWantVisit(), ListVisited()],
                ),
              ),
            ],
          ),
        ));
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
  List<SightCardMeta> list = [
    mocks[0].copyWith(visited: true),
    mocks[1].copyWith(visited: true)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var index in list)
            DragTarget<SightCardMeta>(
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                setState(() {
                  var newPos = list.indexOf(index);
                  var dragIndex = list.indexOf(data);
                  var tmp = index;
                  list[newPos] = data;
                  list[dragIndex] = tmp;
                });
              },
              builder: (context, List<SightCardMeta> candidate, rejected) {
                return Draggable<SightCardMeta>(
                  data: index,
                  child: SightCard(
                    index,
                    key: ValueKey(index),
                  ),
                  childWhenDragging: SizedBox(
                      height: 240,
                      width: MediaQuery.of(context).size.width - 16,
                      child: SightCard(
                        index,
                        sightCardState: SightCardState.drag,
                      )),
                  feedback: SizedBox(
                      height: 240,
                      width: MediaQuery.of(context).size.width - 16,
                      child: SightCard(
                        index,
                        sightCardState: SightCardState.drag,
                      )),
                );
              },
            ),
        ],
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
    return ListView.builder(
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
        });
  }
}
