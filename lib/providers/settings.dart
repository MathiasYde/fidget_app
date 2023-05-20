import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  ThemeMode themeMode;

  Settings({
    this.themeMode = ThemeMode.system,
  });

  void updateWith({
    ThemeMode? themeMode,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (themeMode != null) {
      prefs.setInt("themeMode", themeMode.index);
      this.themeMode = themeMode;
    }

    notifyListeners();
  }

  factory Settings.fromSharedPreferences(SharedPreferences prefs) {
    return Settings(
      themeMode: ThemeMode.values[prefs.getInt('themeMode') ?? 0],
    );
  }
}
