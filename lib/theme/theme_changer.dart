import 'package:flutter/material.dart';

import '../utils/colors_app.dart';

class ThemeCharger extends ChangeNotifier {
  ThemeCharger(int theme) {
    switch (theme) {
      case 1: // light
        _isDark = false;
        _currentTheme = themeLight;
        break;
      case 2: // dark
        _isDark = true;
        _currentTheme = themeDark;
        break;
      default:
        _isDark = false;
        _currentTheme = themeLight;
    }
  }

  ThemeData _currentTheme = ThemeData.light();
  get currentTheme => _currentTheme;

  bool _isDark = false;
  bool get isDark => _isDark;
  set isDark(bool value) {
    _isDark = value;
    if (value) {
      _currentTheme = themeDark;
    } else {
      _currentTheme = themeLight;
    }
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

final themeDark = ThemeData.dark().copyWith(colorScheme: colorSchemedark);
final themeLight = ThemeData.light().copyWith(colorScheme: colorSchemeLight);

//LIGHT
const ColorScheme colorSchemeLight = ColorScheme(
  background: Colors.white,
  onBackground: Colors.white,
  brightness: Brightness.light,
  primary: Colors.black,
  onPrimary: Colors.grey,
  secondary: Colors.amber,
  onSecondary: Colors.amberAccent,
  error: Colors.red,
  onError: Colors.redAccent,
  surface: Colors.yellow,
  onSurface: Colors.yellowAccent,
);

//DARK
ColorScheme colorSchemedark = ColorScheme(
  background: ColorsApp.mapsBlack[2]!,
  onBackground: ColorsApp.mapsBlack[1]!,
  brightness: Brightness.dark,
  primary: ColorsApp.mapGrises[1]!,
  onPrimary: ColorsApp.mapGrises[2]!,
  secondary: ColorsApp.mapGrises[3]!,
  onSecondary: ColorsApp.mapGrises[4]!,
  error: ColorsApp.mapCream[2]!,
  onError: Colors.redAccent,
  surface: Colors.white,
  onSurface: Colors.yellowAccent,
);
