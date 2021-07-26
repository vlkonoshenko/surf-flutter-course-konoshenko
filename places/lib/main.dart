import 'package:flutter/material.dart';
import 'package:places/data/interactor/setting_interactor.dart';
import 'package:places/res/themes.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';

void main() {
  runApp(
    const App(),
  );
}

ChangeNotifier themeNotifier = ChangeNotifier();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    themeNotifier.addListener(() {
      setState(() {
        SettingInteractor().changeTheme();
      });
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: SettingInteractor().isDarkMode ? darkTheme : lightTheme,
      routes: {
        '/': (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        FilterScreen.routeName: (context) => const FilterScreen(),
        AddSightScreen.routeName: (context) => const AddSightScreen(),
        SelectCategoryScreen.routeName: (context) =>
            const SelectCategoryScreen(),
        SightSearchScreen.routeName: (context) => const SightSearchScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      },
      initialRoute: '/',
    );
  }
}
