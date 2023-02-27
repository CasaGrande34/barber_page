import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
//Colors -------------------------------------🔥
  static const colorBackgroundScaffoldNegro = Color(0xff050003);
  static const colorBackgroundScaffold2 = Color(0xff161917);
  static const colorHeader = Color(0xff210123);
  static const colorContainerTitle = Colors.blueGrey;
  static const colorNegroMate = Color(0xff03001c);
  static const yellowMarcoContainer = Colors.yellow;

  static const mapCream = {
    1: Color(0xffedfb95),
    2: Color(0xffdae883),
    3: Color(0xffc7d572),
    4: Color(0xffb3c260),
    5: Color(0xffa0af4e),
  };
  static const mapBlueLight = {
    1: Color(0xff1acffd),
    2: Color(0xff14bdea),
    3: Color(0xff0dabd7),
    4: Color(0xff0798c4),
    5: Color(0xff0086b1),
  };
  static const mapBlueDark = {
    1: Color(0xff1e7aa6),
    2: Color(0xff176a95),
    3: Color(0xff0f5a83),
    4: Color(0xff084a72),
    5: Color(0xff003a60),
  };

//Add - Space --------------------------------🔥
  static Widget addVerticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget addHorizontalSpace(double width) {
    return SizedBox(
      width: width,
    );
  }

// Padding -----------------------------🔥
  static const padding5 = 5.0;
  static const padding10 = 10.0;
  static const padding15 = 15.0;
  static const padding20 = 20.0;
  static const padding25 = 25.0;
  static const padding30 = 30.0;

//Fonts ----------------------------🔥
  static final oldStandardTt = GoogleFonts.oldStandardTt(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final roboto = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 25,
  );
}
