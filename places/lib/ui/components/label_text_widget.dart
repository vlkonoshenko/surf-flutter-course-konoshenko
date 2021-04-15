import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

class LabelWidget extends StatelessWidget {
  final String text;

  const LabelWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text.toUpperCase(),
          style: matCaption.copyWith(color: Color(0xff7C7E92)),
        ),
      ],
    );
  }
}
