import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/favorites_screen/widgets/favorites_list.dart';
import 'package:places/ui/screen/favorites_screen/widgets/list_visited.dart';

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
          children: [
            Container(
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
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  FavoritesList(),
                  ListVisited(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
