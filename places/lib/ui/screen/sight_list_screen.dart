import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final _greenFromFigma = Color(0xff4CAF50);
  final _yellowFromFigma = Color(0xffFCDD3D);

  final TextStyle _titleStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 32,
    color: Color(0xff3B3E5B),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 72),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(style: _titleStyle, children: [
                _textSpanFirstLetterColor('Список\n', _greenFromFigma),
                _textSpanFirstLetterColor('интересных мест', _yellowFromFigma),
              ]),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Container(),
      ),
    );
  }

  ///Change the color of the capital letter in text
  TextSpan _textSpanFirstLetterColor(String text, Color color) {
    return TextSpan(children: [
      TextSpan(
        text: text.characters.take(1).toString(),
        style: TextStyle(color: color),
      ),
      TextSpan(text: text.characters.skip(1).toString())
    ]);
  }
}
