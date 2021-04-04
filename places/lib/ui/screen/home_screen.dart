import 'package:flutter/material.dart';
import 'package:places/res/res.dart';
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
    _tabController = TabController(length: 4, vsync: this);
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
          Container(
            child: Center(child: Text('Tab Map')),
          ),
          VisitingScreen(),
          Container(
            child: Center(child: Text('Tab Settings')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => _tabController.animateTo(value),
        currentIndex: _tabController.index,
        selectedItemColor: primaryTextColor,
        unselectedItemColor: secondaryTextColor.withOpacity(0.4),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: '1'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: '2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: '3'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: '4'),
        ],
      ),
    );
  }
}
