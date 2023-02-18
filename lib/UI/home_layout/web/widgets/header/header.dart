import 'package:flutter/material.dart';

//dependencies
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/providers/scroll_provider.dart';
import 'package:landing_page/theme/theme_changer.dart';

//file addresses
import 'package:landing_page/utils/spaces.dart';
import 'package:landing_page/UI/home_layout/web/widgets/header/theme_charger_switch.dart';
import 'package:provider/provider.dart';

import 'navbar_item.dart';

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
  ];

/* 
recibimos un numero como parametro y vamos a indicar que si el indice es diferente de este numero dado entonces 
le indicamos a la lista selected en la posicion del indice que sea falso pero si el numero dado es igual al indice entonces el valor 
de la lista se transforma en true y se transforma en true entonces seguimos creando logica para nuestro header
 */
  void select(int n) {
    for (int i = 0; i < 4; i++) {
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
    //ScrollController
    final handleScroll = Provider.of<ScrollHandlerProvider>(context);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      color: appTheme.colorScheme.onSecondary,
      height: h * .1,
      width: w,
      child: Row(
        children: [
          addHorizontalSpace(30),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: FadeInImage(
              placeholderFilterQuality: FilterQuality.low,
              image: AssetImage('assets/logos/logo_barberia_color.png'),
              placeholder: AssetImage('assets/props/loading.gif'),
            ),
          ),
          addHorizontalSpace(5),
          if (w >= 789)
            Text(
              'Shelby - BarberShop',
              style: GoogleFonts.rye(
                fontSize: 15,
                color: appTheme.colorScheme.secondary,
              ),
            ),
          const Spacer(),
          NavBarItem(
            text: 'Home',
            //le indicamos a cada NavBarItem un valor de la lista con el indice
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
          addHorizontalSpace(30),
          if (w >= 636) const ThemeChangerButton(),
          addHorizontalSpace(13),
        ],
      ),
    );
  }
}
