import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/colors.dart';
import 'package:places/res/icons.dart';

class TextFieldCleanSuffix extends StatelessWidget {
  final TextEditingController textEditingController;

  const TextFieldCleanSuffix(
    this.textEditingController, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        textEditingController.clear();
      },
      child: SvgPicture.asset(
        iconClear,
        color: lmMainColor,
      ),
    );
  }
}
