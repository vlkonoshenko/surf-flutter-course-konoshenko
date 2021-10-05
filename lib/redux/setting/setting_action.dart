import 'package:flutter/foundation.dart';

abstract class SettingAction {
  const SettingAction();
}

@immutable
class SwitchThemeAction extends SettingAction {
  final bool isDartMode;

  const SwitchThemeAction({required this.isDartMode}) : super();
}
