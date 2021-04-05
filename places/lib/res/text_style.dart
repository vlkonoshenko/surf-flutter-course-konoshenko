import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

TextStyle _text = TextStyle(
  color: primaryTextColor,
  fontStyle: FontStyle.normal,
);

TextStyle _textRegular = _text.copyWith(fontWeight: FontWeight.normal);

TextStyle textRegular14 = _textRegular.copyWith(fontSize: 14);
TextStyle textRegularSecondary14 =
    textRegular14.copyWith(color: secondaryTextColor);
TextStyle textRegular16 = _textRegular.copyWith(fontSize: 16);
TextStyle textRegular24 = _textRegular.copyWith(fontSize: 24);

TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500);
TextStyle textMedium16 = textMedium.copyWith(fontSize: 16);
TextStyle textMedium18 = textMedium.copyWith(fontSize: 18);

///BOLD
TextStyle _textBold = _text.copyWith(fontWeight: FontWeight.w700);
TextStyle textBoldSecondary14 =
    _textBold.copyWith(fontSize: 14, color: secondaryTextColor);
TextStyle textBoldPrimary14 =
    _textBold.copyWith(fontSize: 14, color: primaryTextColor);
TextStyle textBold32 = _textBold.copyWith(fontSize: 32);
TextStyle textBold24 = _textBold.copyWith(fontSize: 24);

TextStyle textButton = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 14,
  letterSpacing: 0.03,
  color: Colors.white,
);
