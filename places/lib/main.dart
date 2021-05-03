import 'package:flutter/material.dart';
import 'package:places/res/themes.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

void main() {
  runApp(const App());
}

ChangeNotifier themeNotifier = ChangeNotifier();
bool isDarkMode = false;

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

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
        '/': (context) => const OnboardingScreen(),
        SightDetailsScreen.routeName: (context) => const SightDetailsScreen(),
        FilterScreen.routeName: (context) => const FilterScreen(),
        AddSightScreen.routeName: (context) => const AddSightScreen(),
        SelectCategoryScreen.routeName: (context) =>
            const SelectCategoryScreen(),
        SightSearchScreen.routeName: (context) => const SightSearchScreen(),
      },
      initialRoute: '/',

    );
  }
}
