import 'package:flutter/widgets.dart';
import 'package:landing_page/UI/home_layout/mobile/para_acomodar/turnos_screen.dart';

import '../UI/home_layout/mobile/para_acomodar/screens_exports.dart';

class BottomNavbarState extends ChangeNotifier {
  final List<Widget> screens = const [
    TurnosScreen(),
    ChatScreen(),
    NotificationsScreen(),
    // ProfileScreen(),
  ];

  int selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
