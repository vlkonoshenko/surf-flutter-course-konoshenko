import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

import 'ui/screen/sight_details_screen.dart';

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
      ),
      home: SightListScreen(),
    );
  }
}
