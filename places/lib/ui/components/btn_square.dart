import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/icons.dart';

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
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              iconArrow,color: Theme.of(context).primaryColor,
            ),
          ),
        ));
  }
}
