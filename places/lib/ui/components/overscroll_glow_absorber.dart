import 'package:flutter/material.dart';

class OverscrollGlowAbsorber extends StatelessWidget {
  const OverscrollGlowAbsorber({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (Notification notification) {
        if (notification is OverscrollIndicatorNotification) {
          notification.disallowGlow();
        }

        return false;
      },
      child: child,
    );
  }
}
