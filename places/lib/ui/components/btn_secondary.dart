import 'package:flutter/material.dart';

class BtnSecondary extends StatelessWidget {
  final String title;

  const BtnSecondary({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 24,
          width: 24,
          child: Placeholder(),
        ),
        SizedBox(width: 8),
        Text(title,
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.w400))
      ],
    );
  }
}
