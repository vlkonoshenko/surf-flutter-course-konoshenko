import 'package:flutter/material.dart';
import 'package:places/res/colors.dart';

class BtnWhiteSquare extends StatelessWidget {
  final IconData icon;

  const BtnWhiteSquare({
    @required this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).canvasColor,
        ),
        height: 32,
        width: 32,
        child: IconButton(
          icon: Icon(
            icon,
            size: 12,
            color: Theme.of(context).primaryTextTheme.subtitle2.color,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ));
  }
}
