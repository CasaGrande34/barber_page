import 'package:flutter/material.dart';

import '../UI/home_layout/web/views/home_view_sections/export_sections.dart';

class ConstantApp {
  static const List<String> listaAppbar = [
    'Home',
    'Products',
    'History',
    'Products',
    'Money',
    'Contact me'
  ];

  /* 
 Aca tengo la lista de secciones que se muestran en la landingpage con sus respectivas keys para poder hacer scroll
 a la posicion en la singlechidlscrollview
 */
  static const List<Widget> containersWidget = [
    FirstSection(),
    SecondSection(),
    ThirdSection(),
    FourthSection(),
    FiveSection(),
    SixSection(),
  ];

  static List<GlobalKey> keysList = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  static double appBarHeight = 0;
}
