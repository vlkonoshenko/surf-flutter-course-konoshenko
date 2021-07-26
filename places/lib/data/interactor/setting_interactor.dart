class SettingInteractor {
  static final SettingInteractor _singleton = SettingInteractor._();
  var isDarkMode = false;

  factory SettingInteractor() => _singleton;

  SettingInteractor._();

  void changeTheme() {
    isDarkMode = !isDarkMode;
  }
}
