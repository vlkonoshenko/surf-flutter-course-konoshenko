import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/icons.dart';

class BtnAddPhoto extends StatelessWidget {
  final VoidCallback onAddClick;

  const BtnAddPhoto({
    @required this.onAddClick,
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddClick,
      child: Container(
        height: 72,
        width: 72,
        margin: EdgeInsets.only(right: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            iconPlus,
            color: Theme.of(context).accentColor,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Theme.of(context).accentColor, width: 2)),
      ),
    );
  }
}
