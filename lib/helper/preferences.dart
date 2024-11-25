// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment, constant_identifier_names

import 'dart:convert';

import 'package:flutter_bloc_demo/helper/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences sharedPreferences;
  static const String USER_SELECTED_THEME = 'user_selected_theme';

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveTheme(AppThemes selectedTheme) async {
    if (selectedTheme == null) {
      selectedTheme = AppThemes.light;
    }

    String theme = jsonEncode(selectedTheme.toString());
    sharedPreferences.setString(USER_SELECTED_THEME, theme);
  }

  static AppThemes? getTheme() {
    String? theme = sharedPreferences.getString(USER_SELECTED_THEME);

    if (theme == null) {
      return AppThemes.light;
    }
    return convertStringToTheme(jsonDecode(theme));
  }

  static AppThemes? convertStringToTheme(String themeString) {
    for (AppThemes theme in AppThemes.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }

/*
  static Future<AppThemes> getTheme() async {
    String? theme = sharedPreferences.getString(USER_SELECTED_THEME);

    if (theme == null) {
      return AppThemes.light;
    }
    return getThemeFromString(jsonDecode(theme));
  }

  static AppThemes? getThemeFromString(String themeString) {
    for (AppThemes theme in AppThemes.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }
  */
}
