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
);
final darkTheme = ThemeData(
    canvasColor: dmCanvasColor,
    cardColor: dmCardColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: dmCanvasColor,
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        color: Colors.white,
      ),
      labelColor: Colors.white,
      unselectedLabelColor: secondaryTextColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white.withOpacity(0.2)));
