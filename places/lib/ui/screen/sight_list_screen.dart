import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 72),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Список\nинтересных мест',
                style: textBold32,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemCount: mocks.length,
          itemBuilder: (context, index) => SightCard(mocks[index]),
        ));
  }
}
