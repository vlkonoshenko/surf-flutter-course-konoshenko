import 'package:flutter/material.dart';
import 'package:places/res/res.dart';
import 'package:places/service/shared_preference.dart';
import 'package:places/ui/screen/home_screen.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/indicator.dart';

import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding_screen';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  int currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: nextFunction,
            child: Text(
              isLastPage() ? '' : 'Пропустить',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (value) =>
                        setState(() => currentIndex = value),
                    controller: _pageController,
                    children: const [
                      OnboardingPage(
                        title: 'Добро пожаловать\n в Путеводитель',
                        body: 'Ищи новые локации и сохраняй\n самые любимые. ',
                        image: iconTutorial1,
                      ),
                      OnboardingPage(
                        title: 'Построй маршрут \n и отправляйся в путь',
                        body:
                            'Достигай цели максимально \n быстро и комфортно.',
                        image: iconTutorial2,
                      ),
                      OnboardingPage(
                        title: 'Добавляй местa,\nкоторые нашёл сам',
                        body:
                            'Делись самыми интересными\n и помоги нам стать лучше!',
                        image: iconTutorial3,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Indicator(positionIndex: 0, currentIndex: currentIndex),
                        const SizedBox(width: 10),
                        Indicator(positionIndex: 1, currentIndex: currentIndex),
                        const SizedBox(width: 10),
                        Indicator(positionIndex: 2, currentIndex: currentIndex),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isLastPage()
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            SharedPreference.setIsFirstStart(isFirstRun: false);
                            Navigator.of(context)
                                .pushReplacementNamed(HomeScreen.routeName);
                          },
                          child: Text(
                            'на старт'.toUpperCase(),
                            style: textButtonElevation,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool isLastPage() {
    return currentIndex == 2;
  }

  void nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  void previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }
}
