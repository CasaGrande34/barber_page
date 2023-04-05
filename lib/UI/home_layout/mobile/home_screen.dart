import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_changer.dart';
import '../../../utils/utils.dart';
import 'screens/screens_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = const [
    TurnosScreen(),
    ChatScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Scaffold(
        body: SizedBox(
          height: h,
          width: w,
          child: PageView(
            controller: _pageController,
            children: screens,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: _onItemTapped,
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
        ));
  }
}
