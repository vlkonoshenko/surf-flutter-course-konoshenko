import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

class BtnRaised extends StatelessWidget {
  const BtnRaised({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24,
              width: 24,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Построить маршрут'.toUpperCase(),
              style: textButton,
            ),
          ],
        ));
  }
}
