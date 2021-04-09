import 'package:flutter/material.dart';

TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
);

TextStyle matHeadline5 = _text.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 24,
);

TextStyle matHeadline4 = _text.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 32,
);
TextStyle matSubtitle1 = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

TextStyle matSubtitle2 = _text.copyWith(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

TextStyle matBodyText1 = _text.copyWith(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle matCaption = _text.copyWith(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: 12,
);

TextStyle textAppBar = _text.copyWith(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

TextStyle textButtonElevation = _text.copyWith(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.03,

  fontSize: 14,
);
