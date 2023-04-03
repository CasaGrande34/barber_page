import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landing_page/utils/utils.dart';

class StylesApp {
  static InputDecoration inputDecorationURL = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: SizesApp.padding30),
      label: Text('Ingrese su URL'),
      suffixIcon: Icon(FontAwesomeIcons.sheetPlastic),
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder());

  static InputDecoration inputDecorationItem = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: SizesApp.padding10),
      label: Text(
        'Dejenos su comentario',
      ),
      suffixIcon: Icon(FontAwesomeIcons.comment),
      labelStyle: TextStyle(color: Colors.black26),
      border: OutlineInputBorder());

  static InputDecoration authInputDecoration({
    required String hintText,
    required Widget icon,
    required String labelText,
  }) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        // hoverColor: ColorsApp.primary,
        labelText: labelText,
        labelStyle: const TextStyle(
          // color: ColorsApp.primary,
          fontSize: 15,
        ),
        hintText: hintText,
        // hintStyle: const TextStyle(fontSize: 13, color: ColorsApp.background),
        floatingLabelStyle: const TextStyle(
          // color: ColorsApp.onPrimary,
          fontSize: 18,
        ),
        // suffixIconColor: ColorsApp.onBackground,
        suffixIcon: icon,
        // enabledBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(6)),
        // borderSide: BorderSide(color: ColorsApp.background, width: 1)),
      );
}
