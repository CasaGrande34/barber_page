import 'package:flutter/material.dart';

class ThemeCharger extends ChangeNotifier {
  
  ThemeCharger(int theme) {
    
    switch(theme ) {
      
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
    if( value ) {
      _currentTheme = themeDark;
    } else {
      _currentTheme = themeLight;
    }
    notifyListeners();
  }
  
  
}

final  themeDark = ThemeData.dark().copyWith(
  colorScheme: colorSchemedark,
  // scaffoldBackgroundColor: Colors.black,
  // textTheme: textTheme(context),
  // appBarTheme: appBarTheme(context),
  // inputDecorationTheme: inputDecorationData(context),
  // colorScheme: lightThemeColors(context),
  
);

final  themeLight = ThemeData.light().copyWith(
  colorScheme: colorSchemeLight
  // scaffoldBackgroundColor: Colors.pink
  // colorScheme: 
  // appBarTheme: appBarTheme(context),
  // inputDecorationTheme: inputDecorationData(context),
  // colorScheme: lightThemeColors(context),
    
);

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
const ColorScheme colorSchemedark = ColorScheme(
    background: Color(0xff6f6f5), 
    onBackground: Color(0xff464646), 
    brightness: Brightness.dark, 
    primary: Color(0xffFFF8E1), 
    onPrimary: Colors.amber, 
    secondary: Colors.black, 
    onSecondary: Colors.grey, 
    error: Colors.red, 
    onError: Colors.redAccent, 
    surface: Colors.white, 
    onSurface: Colors.yellowAccent,
);