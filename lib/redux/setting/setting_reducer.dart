import 'package:places/redux/app_state.dart';
import 'package:places/redux/setting/setting_action.dart';
import 'package:places/redux/setting/setting_state.dart';

AppState getSwitchThemeReducer(AppState state, SwitchThemeAction action) {
  return state.copyWith(
    settingState: SettingState(
      isDarkMode: action.isDartMode,
    ),
  );
}
