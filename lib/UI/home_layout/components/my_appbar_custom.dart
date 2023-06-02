import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/scroll_provider.dart';
import '../../../utils/utils.dart';

class MyAppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBarCustom({super.key});

  @override
  State<MyAppBarCustom> createState() => _MyAppBarCustomState();

  @override
  Size get preferredSize => Size.fromHeight(ConstantApp.appBarHeight);
}

class _MyAppBarCustomState extends State<MyAppBarCustom> {
  final List<bool> selected = List<bool>.generate(
      ConstantApp.listaAppbar.length, (index) => index == 0);

  void select(int n) {
    for (int i = 0; i < ConstantApp.listaAppbar.length; i++) {
      selected[i] = i == n;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle libreStyle =
        FontsApp.nunito.copyWith(color: Colors.white, fontSize: 17);

    final scroll = Provider.of<ScrollHandlerProviderCustom>(context);

    if (Responsive.isDesktop(context)) {
      //WEB
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        height: ConstantApp.appBarHeight,
        child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset(
                'assets/logos/logo_barberia_color.png',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.white.withOpacity(0.3),
            elevation: 0,
            actions: [
              ...ConstantApp.listaAppbar.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return _AppbarItem(
                  item,
                  active: selected[index],
                  touched: () {
                    setState(() {
                      select(index);
                      scroll.boxScroll(index, Curves.ease, 2);
                    });
                  },
                );
              }).toList(),
            ]),
      );
    }

    //MOBILE
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      height: ConstantApp.appBarHeight,
      child: AppBar(
          title: Row(
            children: [
              SizesApp.addHorizontalSpace(SizesApp.padding15),
              Text(
                'Portafolio',
                style: libreStyle,
              ),
            ],
          ),
          titleSpacing: 2,
          backgroundColor: Colors.white.withOpacity(0.3),
          elevation: 0,
          actions: [
            PopupMenuButton(
              color: Colors.blueGrey,
              icon: const Icon(Icons.menu, color: Colors.white),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: _AppbarItem(
                    'Home',
                    active: selected[0],
                    touched: () {
                      setState(() {
                        select(0);
                        scroll.boxScroll(0, Curves.ease, 2);
                      });
                    },
                  ),
                ),
                PopupMenuItem(
                  child: _AppbarItem(
                    'Skills',
                    active: selected[1],
                    touched: () {
                      setState(() {
                        select(1);
                        scroll.boxScroll(1, Curves.ease, 2);
                      });
                    },
                  ),
                ),
              ],
            )
          ]),
    );
  }
}

class _AppbarItem extends StatelessWidget {
  final String name;
  final bool active;
  final Function touched;

  const _AppbarItem(this.name, {required this.touched, required this.active});

  @override
  Widget build(BuildContext context) {
    final TextStyle nunitoStyle =
        FontsApp.nunito.copyWith(color: Colors.white, fontSize: 16);

    return InkWell(
      onTap: () {
        touched();
      },
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizesApp.padding20),
          child: Text(
            name,
            style: nunitoStyle,
          ),
        ),
      ),
    );
  }
}
