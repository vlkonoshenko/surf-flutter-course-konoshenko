import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
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
                  _tabController.index == 0 ? iconListFull : iconList,color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,),
              label: 'List sight'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _tabController.index == 1 ? iconHeartFull : iconHeart,color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,),
              label: '2'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _tabController.index == 2 ? iconSettingsFull : iconSettings,color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,),
              label: '2')
        ],
      ),
    );
  }
}
