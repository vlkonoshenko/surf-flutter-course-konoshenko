import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/bloc/favorites_list/favorites_list_bloc.dart';
import 'package:places/bloc/visited_list/visited_list_bloc.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/ui/screen/favorites_screen/widgets/favorites_list.dart';
import 'package:places/ui/screen/favorites_screen/widgets/list_visited.dart';
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
            Expanded(
              child: TabBarView(
                children: [
                  BlocProvider<FavoritesListBloc>(
                    create: (context) => FavoritesListBloc(context.read<PlaceRepository>()),
                    child: const FavoritesList(),
                  ),
                  BlocProvider<VisitedListBloc>(
                    create: (context) => VisitedListBloc(context.read<PlaceRepository>()),
                    child: const ListVisited(),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
