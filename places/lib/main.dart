import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/interactor/setting_interactor.dart';
import 'package:places/res/themes.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filter_screen/filters_screen.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const App(),
  );
}

ChangeNotifier themeNotifier = ChangeNotifier();
SettingInteractor settingInteractor = SettingInteractor();

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
        settingInteractor.changeTheme();
      });
    });

    return MultiProvider(
      providers: [
        Provider<SettingInteractor>(create: (_) => settingInteractor),
        Provider<SearchInteractor>(create: (_) => SearchInteractor()),
        Provider<PlaceInteractor>(create: (_) => PlaceInteractor()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: settingInteractor.isDarkMode ? darkTheme : lightTheme,
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
      ),
    );
  }
}
