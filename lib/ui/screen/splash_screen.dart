import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/res.dart';

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
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xffFCDD3D), Color(0xff4CAF50)],
        ),
      ),
      child: RotationTransition(
        turns: _controller,
        child: Center(
          child: SvgPicture.asset(
            iconSplash,
            height: 180,
            width: 180,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToNext() {
    Future<void>.delayed(const Duration(seconds: 2)).then(
      (result) => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
  }
}
