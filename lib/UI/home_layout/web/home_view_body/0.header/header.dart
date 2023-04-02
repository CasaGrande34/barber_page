import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';
import 'widgets/navbar_item.dart';

import 'package:provider/provider.dart';
import 'package:landing_page/providers/scroll_provider.dart';

import 'package:landing_page/theme/theme_changer.dart';
import 'package:landing_page/UI/home_layout/web/home_view_body/0.header/widgets/theme_charger_switch.dart';

const cantidadDePaginas = 6;

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final handleScroll = Provider.of<ScrollHandlerProviderCustom>(context);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    if (Responsive.isDesktop(context)) {
      return const _HeaderDesktop();
    }
    return const _HeaderMobile();
  }
}

class _HeaderDesktop extends StatefulWidget {
  const _HeaderDesktop();

  @override
  State<_HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<_HeaderDesktop> {
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
      color: appTheme.colorScheme.primary,
      height: h * .13,
      width: w,
      child: Stack(
        children: [
          Row(
            children: [
              SizesApp.addHorizontalSpace(30),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: FadeInImage(
                  image: AssetImage('assets/logos/logo_barberia_color.png'),
                  placeholder: AssetImage('assets/props/loading.gif'),
                ),
              ),
              SizesApp.addHorizontalSpace(5),
              if (w >= 730)
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
              SizesApp.addHorizontalSpace(50.0),
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
              SizesApp.addHorizontalSpace(50.0),
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
              SizesApp.addHorizontalSpace(50.0),
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
              SizesApp.addHorizontalSpace(50.0),
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
              SizesApp.addHorizontalSpace(50.0),
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
              SizesApp.addHorizontalSpace(30),
              if (w >= 636) const ThemeChangerButton(),
              SizesApp.addHorizontalSpace(13),
            ],
          ),
          const Positioned(
            bottom: 0,
            child: ProgressHeader(),
          )
        ],
      ),
    );
  }

  obtenerelPorcentaje() {
    for (var i = 0; i < cantidadDePaginas; i++) {
      Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ));
    }
  }
}

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 1200,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );
  }
}

class _HeaderMobile extends StatefulWidget {
  const _HeaderMobile();

  @override
  State<_HeaderMobile> createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<_HeaderMobile> {
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
      color: appTheme.colorScheme.primary,
      height: h * .12,
      width: w,
      child: Row(
        children: [
          SizesApp.addHorizontalSpace(30),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: FadeInImage(
              image: AssetImage('assets/logos/logo_barberia_color.png'),
              placeholder: AssetImage('assets/props/loading.gif'),
            ),
          ),
          const Spacer(),
          const Icon(Icons.home, size: SizesApp.padding25),
          SizesApp.addHorizontalSpace(SizesApp.padding15),
        ],
      ),
    );
  }
}
