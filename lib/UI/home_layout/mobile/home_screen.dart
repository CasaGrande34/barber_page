import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:landing_page/UI/home_layout/mobile/screens/first_section_screen.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_changer.dart';
import '../../../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Shelby Barber',
            style: TextStyle(
              color: appTheme.colorScheme.primary,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          height: h,
          width: w,
          child: Column(
            children: const [FirstSectionScreen()],
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: GNav(
            gap: 15,
            activeColor: Colors.amber,
            color: Colors.white,
            hoverColor: Colors.red,
            mainAxisAlignment: MainAxisAlignment.center,
            rippleColor: Colors.blue,
            tabBackgroundColor: Colors.white12,
            textStyle: FontsApp.oldStandardTt,
            tabs: [
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
        ));
  }
}
