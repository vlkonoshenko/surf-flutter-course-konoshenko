class SettingInteractor {
  static final SettingInteractor _singleton = SettingInteractor._();

  bool get isDarkMode => _isDarkMode;
  bool _isDarkMode = false;

  factory SettingInteractor() => _singleton;

  SettingInteractor._();

  void changeTheme() {
    _isDarkMode = !_isDarkMode;
  }
}
