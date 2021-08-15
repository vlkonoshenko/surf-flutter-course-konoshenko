import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';

class SightListErrorWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const SightListErrorWidget({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconError,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: textAppBar.copyWith(color: lmSecondary2Color),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: textAppBar.copyWith(color: lmSecondary2Color),
          ),
        ],
      ),
    );
  }
}
