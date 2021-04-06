import 'package:flutter/material.dart';

import 'colors.dart';

final lightTheme = ThemeData(
  canvasColor: lmCanvasColor,
  cardColor: lmCardColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: lmCanvasColor,
  ),
  primaryTextTheme: TextTheme(
    headline4: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 32,
      color: Color(0xff3B3E5B),
    ),
    headline5: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Color(0xff3B3E5B),
    ),
    subtitle1: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xff3B3E5B),
    ),
    subtitle2: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Color(0xff3B3E5B),
    ),
    bodyText1: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Color(0xff3B3E5B),
    ),
    caption: TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: Color(0xff7C7E92).withOpacity(0.56),
    ),
  ),
);
final darkTheme = ThemeData(
    canvasColor: dmCanvasColor,
    cardColor: dmCardColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.white,
      ),
      backgroundColor: dmCanvasColor,
    ),
    primaryTextTheme: TextTheme(
      headline4: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: Colors.white.withOpacity(0.56),
      ),
    ),
    dividerColor: Color(0xff7C7E92),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        primary: Color(0xff6ADA6F),
        minimumSize: Size.fromHeight(48),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        color: Colors.white,
      ),
      unselectedLabelColor: Color(0xff7C7E92),
      labelColor: Color(0xff3B3E5B),
      labelStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xff3B3E5B),
      ),
      unselectedLabelStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xff7C7E92),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white.withOpacity(0.2)));
