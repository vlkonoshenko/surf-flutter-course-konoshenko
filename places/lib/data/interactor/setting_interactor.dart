class SettingInteractor {
  static final SettingInteractor _singleton = SettingInteractor._();

  factory SettingInteractor() => _singleton;

  SettingInteractor._();

  var isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;
  }
}
