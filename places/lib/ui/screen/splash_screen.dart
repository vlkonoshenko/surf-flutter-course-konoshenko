import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future isInitialized;

  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xffFCDD3D), Color(0xff4CAF50)],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconSplash,
            height: 180,
            width: 180,
          ),
        ));
  }

  void _navigateToNext() {
    isInitialized = Future<void>.delayed(const Duration(seconds: 2));
    isInitialized.then(
        (dynamic result) => Navigator.pushReplacementNamed(context, HomeScreen.routeName));
  }
}
