import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/icons.dart';

class BtnAddPhoto extends StatelessWidget {
  const BtnAddPhoto({
    @required this.onAddClick,
    @required this.context,
    Key key,
  }) : super(key: key);

  final VoidCallback onAddClick;

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddClick,
      child: Container(
        height: 72,
        width: 72,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).accentColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            iconPlus,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
