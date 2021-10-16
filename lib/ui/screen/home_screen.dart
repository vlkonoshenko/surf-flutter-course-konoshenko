import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/favorites_screen/visiting_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';

import 'map_screen/map_screen.dart';
import 'map_screen/map_screen_wm.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_listener);
  }

  @override
  void dispose() {
    _tabController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            SightListScreen(),
            MapScreen(
                widgetModelBuilder: (_) => createMapScreenWM(
                    context, StoreProvider.of<AppState>(context))),
            VisitingScreen(),
            SettingsScreen(),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _tabController.animateTo(value),
        currentIndex: _tabController.index,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _tabController.index == 0 ? iconListFull : iconList,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'List sight',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _tabController.index == 1
                  ? Icons.map_rounded
                  : Icons.map_outlined,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _tabController.index == 2 ? iconHeartFull : iconHeart,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _tabController.index == 3 ? iconSettingsFull : iconSettings,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _listener() {
    setState(() {
      return;
    });
  }
}
