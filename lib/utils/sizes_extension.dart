import 'package:flutter/material.dart';

extension NumExtensions on num {
  double get h =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height *
      (this / 100);
  double get w =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width *
      (this / 100);
}
