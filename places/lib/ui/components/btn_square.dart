import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/icons.dart';

class BtnWhiteSquare extends StatelessWidget {
  const BtnWhiteSquare({
    @required this.icon,
    Key key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          shape: BoxShape.circle
        ),

        height: 40,
        width: 40,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              iconClose,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ));
  }
}
