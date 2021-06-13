import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);
  static const String routeName = '/onboarding_screen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
                children: <Widget>[
                  PageView(
                    onPageChanged: (value) =>
                        setState(() => currentIndex = value),
                    controller: _pageController,
                    children: <Widget>[
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
                      children: <Widget>[
                        Indicator(
                          positionIndex: 0,
                          currentIndex: currentIndex,
                        ),
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
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    this.title,
    this.body,
    this.image,
    Key key,
  }) : super(key: key);

  final String title;
  final String body;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            image,
            color: dmCanvasColor,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: textButtonElevation.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: matBodyText1.copyWith(color: lmSecondary2Color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({this.currentIndex, this.positionIndex, Key key})
      : super(key: key);
  final int positionIndex, currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 8,
      width: positionIndex == currentIndex ? 24 : 8,
      decoration: BoxDecoration(
        color: positionIndex == currentIndex ? lmGreenColor : Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
