import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

class BtnSecondary extends StatelessWidget {
  final String title;

  const BtnSecondary({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 24,
          width: 24,
          color: Colors.blue,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: textRegularSecondary14,
        )
      ],
    );
  }
}
