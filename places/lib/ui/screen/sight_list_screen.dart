import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/components/search_bar.dart';
import 'package:places/ui/screen/sight_card.dart';

import 'add_sight_screen.dart';
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
          title: Text(
            "Список интересных мест",
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1
                .copyWith(fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            SearchBar(),
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: ListView.builder(
                itemCount: mocks.length,
                itemBuilder: (context, index) => SightCard(mocks[index]),
              ),
            ),
            Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AddSightScreen.routeName);
                      },
                      child: Container(
                        height: 48,
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffFCDD3D), Color(0xff4CAF50)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: SvgPicture.asset(
                                iconPlus,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Новое место'.toUpperCase(),
                              style: textButtonElevation.copyWith(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
