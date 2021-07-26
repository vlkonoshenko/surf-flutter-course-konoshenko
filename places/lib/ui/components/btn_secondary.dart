import 'package:flutter/material.dart';

class BtnSecondary extends StatelessWidget {
  const BtnSecondary({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 24,
          width: 24,
          child: Placeholder(),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle2!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
