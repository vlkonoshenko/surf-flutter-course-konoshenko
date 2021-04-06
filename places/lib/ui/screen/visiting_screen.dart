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

class ListVisited extends StatelessWidget {
  const ListVisited({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SightCard(mocks[0].copyWith(visited: true)),
        SightCard(mocks[1].copyWith(visited: true))
      ],
    );
  }
}

class ListWantVisit extends StatelessWidget {
  const ListWantVisit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SightCard(mocks[0].copyWith(wantVisit: true)),
      ],
    );
  }
}
