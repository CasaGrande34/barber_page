import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/mobile/screens/first_section_screen.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_changer.dart';

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
    );
  }
}
