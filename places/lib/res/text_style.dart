import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

TextStyle _text = TextStyle(
  color: primaryTextColor,
  fontStyle: FontStyle.normal,
);

TextStyle _textRegular = _text.copyWith(fontWeight: FontWeight.normal);
TextStyle textRegular16 = _textRegular.copyWith(fontSize: 16);

///BOLD
TextStyle _textBold = _text.copyWith(fontWeight: FontWeight.w700);
TextStyle textBold14 =
    _textBold.copyWith(fontSize: 14, color: secondaryTextColor);
TextStyle textBold32 = _textBold.copyWith(fontSize: 32);
