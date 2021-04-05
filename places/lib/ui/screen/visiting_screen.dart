import 'package:flutter/material.dart';
import 'package:places/res/colors.dart';
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "Избранное",
              style: textMedium18,
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Color(0xff3B3E5B),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: secondaryTextColor,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Хочу посетить',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Посетил',
                    ),
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
