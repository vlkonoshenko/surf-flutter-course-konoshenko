import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';

class OnboardingPage extends StatelessWidget {
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
