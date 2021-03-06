import 'package:flutter/material.dart';
import 'package:places/res/res.dart';
import 'package:places/res/text_style.dart';

final lightTheme = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: lmMainColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lmGreenColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: lmGreenColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lmGreenColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  primaryColor: const Color(0xff1A1A20),
  accentColor: lmGreenColor,
  primarySwatch: Colors.green,
  splashColor: const Color(0x32C4C4C4),
  canvasColor: lmCanvasColor,
  cardColor: lmCardColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: lmCanvasColor,
    titleTextStyle: textAppBar.copyWith(color: lmMainColor),
  ),
  primaryTextTheme: TextTheme(
    headline4: matHeadline5.copyWith(color: lmSecondaryColor),
    headline5: matHeadline5.copyWith(color: lmSecondaryColor),
    subtitle1: matSubtitle1.copyWith(color: lmSecondaryColor),
    subtitle2: matSubtitle2.copyWith(color: lmSecondaryColor),
    bodyText1: matBodyText1.copyWith(color: lmSecondaryColor),
    caption: matCaption.copyWith(color: lmSecondary2Color.withOpacity(0.56)),
  ),
  dividerColor: lmSecondaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      textStyle: textButtonElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      primary: lmGreenColor,
      minimumSize: const Size.fromHeight(48),
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(
        25.0,
      ),
      color: lmSecondaryColor,
    ),
    unselectedLabelColor: lmSecondary2Color,
    labelColor: Colors.white,
    labelStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: lmSecondaryColor,
    ),
    unselectedLabelStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: lmSecondary2Color,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: lmMainColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: lmMainColor.withOpacity(0.2),
  ),
);

final darkTheme = ThemeData(
  splashColor: const Color(0x32C4C4C4),
  canvasColor: dmCanvasColor,
  cardColor: dmCardColor,
  primaryColor: const Color(0xffffffff),
  accentColor: dmGreenColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    titleTextStyle: textAppBar.copyWith(color: Colors.white),
    backgroundColor: dmCanvasColor,
  ),
  primaryTextTheme: TextTheme(
    headline4: matHeadline5.copyWith(color: dmSecondaryColor),
    headline5: matHeadline5.copyWith(color: dmSecondaryColor),
    subtitle1: matSubtitle1.copyWith(color: dmSecondaryColor),
    subtitle2: matSubtitle2.copyWith(color: dmSecondaryColor),
    bodyText1: matBodyText1.copyWith(color: dmSecondaryColor),
    caption: matCaption.copyWith(color: dmSecondary2Color.withOpacity(0.56)),
  ),
  dividerTheme: const DividerThemeData(
    thickness: 0.8,
    color: Color(0xff7C7E92),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      textStyle: textButtonElevation,
      primary: dmGreenColor,
      minimumSize: const Size.fromHeight(48),
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(
        25.0,
      ),
      color: Colors.white,
    ),
    unselectedLabelColor: lmSecondary2Color,
    labelColor: lmSecondaryColor,
    labelStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: dmSecondaryColor,
    ),
    unselectedLabelStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: dmSecondary2Color,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.white.withOpacity(0.2),
  ),
);
