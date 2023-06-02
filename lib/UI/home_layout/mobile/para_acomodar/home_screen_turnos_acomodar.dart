import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:landing_page/providers/bottomnavbar_state.dart';

import '../../../../utils/utils.dart';

class HomeScreenTurnosAcomodar extends StatefulWidget {
  const HomeScreenTurnosAcomodar({super.key});

  @override
  State<HomeScreenTurnosAcomodar> createState() => _HomeScreenTurnosAcomodarState();
}

class _HomeScreenTurnosAcomodarState extends State<HomeScreenTurnosAcomodar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final navbar = Provider.of<BottomNavbarState>(context);
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: PageView(
          controller: navbar.pageController,
          children: navbar.screens,
          onPageChanged: (index) {
            setState(() {
              navbar.selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: GNav(
          selectedIndex: navbar.selectedIndex,
          onTabChange: navbar.onItemTapped,
          gap: 15,
          activeColor: Colors.amber,
          color: Colors.white,
          hoverColor: Colors.red,
          mainAxisAlignment: MainAxisAlignment.center,
          rippleColor: Colors.blue,
          tabBackgroundColor: Colors.white12,
          textStyle: FontsApp.oldStandardTt,
          tabs: const [
            GButton(
              margin: EdgeInsets.all(SizesApp.padding10),
              icon: Icons.access_alarm,
              text: 'Turnos',
            ),
            GButton(
              icon: Icons.chat,
              text: 'Chat',
            ),
            GButton(
              icon: Icons.notification_add,
              text: 'Avisos',
            ),
            GButton(
              icon: Icons.person_off_outlined,
              text: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
