import 'package:flutter/material.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            centerTitle: true,
          )),
      routes: {
        '/': (context) => HomeScreen(),
        SightDetailsScreen.routeName: (context) => SightDetailsScreen(),
      },
      initialRoute: '/',
    );
  }
}
