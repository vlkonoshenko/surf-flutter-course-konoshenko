import 'package:flutter/material.dart';
import 'package:places/res/text_style.dart';
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
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Избранное",
                style: textMedium18,
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Хочу посетить',
                      style: textMedium16,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Посетил',
                      style: textMedium16,
                    ),
                  ),
                ],
              )),
          body: TabBarView(
            children: [ListWantVisit(), ListVisited()],
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
