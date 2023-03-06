import 'package:flutter/material.dart';

//file addresses
import '../../home_view_body/export_sections.dart';

/* 

Aca tengo la lista de secciones que se muestran en la landingpage con sus respectivas keys para poder hacer scroll
a la posicion en la singlechidlscrollview

 */
List<Widget> containersWidget = [
  const FirstSection(),
  const SecondSection(),
  const ThirdSection(),
  const FourthSection(),
  const FiveSection(),
  const SixSection(),
];

List<GlobalKey> keysList = [
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
];
