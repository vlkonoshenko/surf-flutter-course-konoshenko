import 'package:flutter/widgets.dart';

class OverscrollGlowAbsorber extends StatelessWidget {
  final Widget child;

  const OverscrollGlowAbsorber({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is OverscrollIndicatorNotification) {
          notification.disallowGlow();
        }

        return false;
      },
      child: child,
    );
  }
}
