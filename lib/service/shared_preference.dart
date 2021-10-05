import 'package:places/data/model/search_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _keyRadiusStart = 'filter_radius_start';
const _keyRadiusEnd = 'filter_radius_end';
const _keyTypeFilter = 'type_filter';
const _keyThemeIsDark = 'theme_is_dark';
const _keyIsFirstStart = 'is_first_start';

class SharedPreference {
  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_keyThemeIsDark) ?? false;
  }

  static Future<bool> getIsFirstStart() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_keyIsFirstStart) ?? true;
  }

  static Future<void> setTheme({required bool isDark}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_keyThemeIsDark, isDark);
  }

  static Future<void> setIsFirstStart({required bool isFirstRun}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_keyIsFirstStart, isFirstRun);
  }

  static Future<void> setSearchFilter(SearchFilter filter) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble(_keyRadiusStart, filter.startPoint);
    await prefs.setDouble(_keyRadiusEnd, filter.endPoint);
    await prefs.setStringList(_keyTypeFilter, filter.categories);
  }

  static Future<SearchFilter> getSearchFilter() async {
    final prefs = await SharedPreferences.getInstance();
    final a = prefs.getStringList(_keyTypeFilter) ?? [];
    final b = prefs.getDouble(_keyRadiusStart) ?? 100.0;
    final c = prefs.getDouble(_keyRadiusEnd) ?? 10000.0;

    return SearchFilter(a, b, c);
  }
}
