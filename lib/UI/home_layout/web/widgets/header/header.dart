import 'package:flutter/material.dart';

import 'navbar_item.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/fonts_app.dart';
import 'package:landing_page/utils/spaces.dart';
import 'package:landing_page/theme/theme_changer.dart';

import 'package:landing_page/providers/scroll_provider.dart';
import 'package:landing_page/UI/home_layout/web/widgets/header/theme_charger_switch.dart';

const cantidadDePaginas = 6;

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final List<bool> selected = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  void select(int n) {
    for (int i = 0; i < cantidadDePaginas; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    final handleScroll = Provider.of<ScrollHandlerProviderCustom>(context);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      color: appTheme.colorScheme.onSecondary,
      height: h * .12,
      width: w,
      child: Row(
        children: [
          addHorizontalSpace(30),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: FadeInImage(
              image: AssetImage('assets/logos/logo_barberia_color.png'),
              placeholder: AssetImage('assets/props/loading.gif'),
            ),
          ),
          addHorizontalSpace(5),
          if (w >= 789)
            // ----------------
            Text(
              'Shelby Barber',
              style: FontsApp.oldStandardTt.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          // ----------------

          const Spacer(),
          NavBarItem(
            text: 'Home',
            active: selected[0],
            touched: () {
              setState(() {
                select(0);
                handleScroll.boxScroll(0, Curves.ease, 3);
              });
            },
          ),
          addHorizontalSpace(50.0),
          NavBarItem(
            text: 'Services',
            active: selected[1],
            touched: () {
              setState(() {
                select(1);
                handleScroll.boxScroll(1, Curves.ease, 3);
              });
            },
          ),
          addHorizontalSpace(50.0),
          NavBarItem(
            text: 'Products',
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
                handleScroll.boxScroll(2, Curves.ease, 3);
              });
            },
          ),
          addHorizontalSpace(50.0),
          NavBarItem(
            text: 'Settings',
            active: selected[3],
            touched: () {
              setState(() {
                select(3);
                handleScroll.boxScroll(3, Curves.ease, 3);
              });
            },
          ),
          addHorizontalSpace(50.0),
          NavBarItem(
            text: 'otro1',
            active: selected[4],
            touched: () {
              setState(() {
                select(4);
                handleScroll.boxScroll(4, Curves.ease, 3);
              });
            },
          ),
          addHorizontalSpace(50.0),
          NavBarItem(
            text: 'Otro2',
            active: selected[5],
            touched: () {
              setState(() {
                select(5);
                handleScroll.boxScroll(5, Curves.ease, 3);
              });
            },
          ),
          addHorizontalSpace(30),
          if (w >= 636) const ThemeChangerButton(),
          addHorizontalSpace(13),
        ],
      ),
    );
  }
}
