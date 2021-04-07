import 'package:flutter/material.dart';

class BtnRaised extends StatelessWidget {
  const BtnRaised({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 24,
            width: 24,
            child: Placeholder(),
          ),
          SizedBox(width: 8),
          Text(
            'Построить маршрут'.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
