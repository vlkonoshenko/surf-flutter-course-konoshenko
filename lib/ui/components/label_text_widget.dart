import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

class LabelTextWidget extends StatelessWidget {
  final String text;

  const LabelTextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text.toUpperCase(),
          style: matCaption.copyWith(color: const Color(0xff7C7E92)),
        ),
      ],
    );
  }
}
