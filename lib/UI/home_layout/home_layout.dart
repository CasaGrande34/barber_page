import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/mobile/screens/home_screen.dart';
import 'package:landing_page/UI/home_layout/web/homeview/homeview.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
    builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const HomeScreenM();
        } else {
          return const HomeView();
        }
      }
    );
  }
}
