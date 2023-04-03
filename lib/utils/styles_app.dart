import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landing_page/utils/utils.dart';

class StylesApp {
  static InputDecoration inputDecorationName = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: SizesApp.padding10),
      label: Text(
        'Escriba su nombre',
      ),
      suffixIcon: Icon(FontAwesomeIcons.person),
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder());

  static InputDecoration inputDecorationEmail = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: SizesApp.padding10),
      label: Text(
        'Escriba su email',
      ),
      suffixIcon: Icon(Icons.email_outlined),
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder());
}
