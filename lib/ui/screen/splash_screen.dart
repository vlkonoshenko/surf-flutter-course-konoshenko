import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:places/data/database/moor_database.dart';
import 'package:places/service/shared_preference.dart';
import 'package:places/ui/components/circle_progress_loader.dart';
import 'package:places/ui/screen/onboarding_screen/onboarding_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _controller.repeat();
    //_navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    final db = MoorDatabase();

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xffFCDD3D), Color(0xff4CAF50)],
        ),
      ),
      child: Column(
        children: [
          FutureBuilder<List<SearchRequest>>(
            future: db.allTodoEntries,
            builder: (context, snap) {
              return snap.hasData
                  ? Column(
                      children: snap.data!.map((e) => Text(e.request)).toList(),
                    )
                  : const CircleProgressLoader();
            },
          ),
          TextButton(
            onPressed: () {
              db.addRequest(SearchRequestsCompanion.insert(request: 'asd'));
            },
            child: Text('Add search'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToNext() async {
    final isFirst = await SharedPreference.getIsFirstStart();

    await Future<void>.delayed(const Duration(seconds: 2)).then(
      (result) => Navigator.pushReplacementNamed(
        context,
        isFirst ? OnboardingScreen.routeName : HomeScreen.routeName,
      ),
    );
  }
}
