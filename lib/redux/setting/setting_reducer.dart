import 'package:places/redux/app_state.dart';
import 'package:places/redux/setting/setting_action.dart';
import 'package:places/redux/setting/setting_state.dart';

AppState getSwitchThemeReducer(AppState state, SwitchThemeAction _) =>
    state.copyWith(
      settingState: SettingState(
        isDarkMode: !state.settingState.isDarkMode,
      ),
    );
