import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  final String body;
  final String image;

  const OnboardingPage({
    required this.title,
    required this.body,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTransition(
            scale: _controller,
            child: SvgPicture.asset(
              widget.image,
              color: dmCanvasColor,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            widget.title,
            style: textButtonElevation.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            widget.body,
            style: matBodyText1.copyWith(color: lmSecondary2Color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
