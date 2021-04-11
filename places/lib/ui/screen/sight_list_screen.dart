import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

import 'filters_screen.dart';

class SightListScreen extends StatefulWidget {
  static const String routeName = '/sight_list_screen';

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
                icon: SvgPicture.asset(iconFilter,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor),
                onPressed: () {
                  Navigator.pushNamed(context, FilterScreen.routeName);
                })
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 72),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Список\nинтересных мест',
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: mocks.length,
              itemBuilder: (context, index) => SightCard(mocks[index]),
            ),
            Positioned(
                bottom: 16,
                left: 92,
                right: 92,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddSightScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(iconPlus),
                      Text('Новое место'.toUpperCase()),
                    ],
                  ),
                ))
          ],
        ));
  }
}
