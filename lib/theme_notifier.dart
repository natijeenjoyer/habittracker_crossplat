import 'package:flutter/material.dart';

enum AppTheme { Light, Dark, Custom }

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  AppTheme _currentAppTheme = AppTheme.Light;

  ThemeData get currentTheme => _currentTheme;
  AppTheme get currentAppTheme => _currentAppTheme;

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.Light:
        _currentTheme = ThemeData.light();
        break;
      case AppTheme.Dark:
        _currentTheme = ThemeData.dark();
        break;
      case AppTheme.Custom:
        _currentTheme = ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        );
        break;
    }
    _currentAppTheme = theme;
    notifyListeners();
  }
}
