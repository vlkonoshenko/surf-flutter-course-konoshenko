import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(this.text, {Key? key}) : super(key: key);

  final String text;

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
