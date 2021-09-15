import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/favorites_screen/visiting_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen/sight_list_screen.dart';

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
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          SightListScreen(),
          VisitingScreen(),
          SettingsScreen(),
        ],
      ),
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
            icon: SvgPicture.asset(
              _tabController.index == 1 ? iconHeartFull : iconHeart,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: '2',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _tabController.index == 2 ? iconSettingsFull : iconSettings,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            ),
            label: '2',
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
