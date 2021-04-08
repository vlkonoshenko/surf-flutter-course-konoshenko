import 'package:flutter/material.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

import 'res/themes.dart';

void main() {
  runApp(App());
}

ChangeNotifier themeNotifier = ChangeNotifier();
bool isDarkMode = false;

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    themeNotifier.addListener(() {
      setState(() {
        isDarkMode = !isDarkMode;
      });
    });
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkMode ? darkTheme : lightTheme,
      routes: {
        '/': (context) => HomeScreen(),
        SightDetailsScreen.routeName: (context) => SightDetailsScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      initialRoute: '/',
    );
  }
}
