import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/data/database/moor_database.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/setting/setting_action.dart';
import 'package:places/service/shared_preference.dart';
import 'package:places/ui/screen/add_sight/add_sight_screen/add_sight_screen_wm.dart';
import 'package:places/ui/screen/add_sight/select_category_screen.dart';
import 'package:places/ui/screen/filter_screen/filters_screen.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import '../data/interactor/place_interactor.dart';
import '../data/interactor/search_interactor.dart';
import '../data/repository/place_repository.dart';
import '../res/themes.dart';
import '../service/api_client.dart';
import '../ui/screen/add_sight/add_sight_screen/add_sight_screen.dart';
import 'app_builder.dart';

class App extends StatefulWidget {
  final Store<AppState> store;

  const App(this.store, {Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MultiProvider(
        providers: [
          Provider<SearchInteractor>(create: (_) => SearchInteractor()),
          Provider<MoorDatabase>(create: (_) => MoorDatabase()),
          Provider<PlaceInteractor>(create: (_) => PlaceInteractor()),
          Provider<PlaceRepository>(
            create: (_) => PlaceRepository(ApiClient().createDio()),
          ),
        ],
        child: AppBuilder(
          builder: (context) {
            return FutureBuilder<bool>(
              future: SharedPreference.getTheme(),
              builder: (context, snap) {
                widget.store.dispatch(
                  SwitchThemeAction(isDartMode: snap.data ?? false),
                );

                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: snap.data ?? false ? darkTheme : lightTheme,
                  routes: {
                    '/': (context) => const SplashScreen(),
                    HomeScreen.routeName: (context) => const HomeScreen(),
                    FiltersScreen.routeName: (context) => const FiltersScreen(),
                    AddSightScreen.routeName: (context) => const AddSightScreen(
                          widgetModelBuilder: createAddSightScreenWM,
                        ),
                    SelectCategoryScreen.routeName: (context) =>
                        const SelectCategoryScreen(),
                    SightSearchScreen.routeName: (context) =>
                        const SightSearchScreen(),
                    OnboardingScreen.routeName: (context) =>
                        const OnboardingScreen(),
                  },
                  initialRoute: '/',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
