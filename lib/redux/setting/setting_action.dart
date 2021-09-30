abstract class SettingAction {}

class SwitchThemeAction extends SettingAction {
  final bool isDartMode;

  SwitchThemeAction(this.isDartMode);
}


