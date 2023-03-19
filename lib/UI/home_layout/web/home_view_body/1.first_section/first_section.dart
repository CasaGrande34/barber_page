import 'package:flutter/material.dart';

import 'widgets/1.widgets_exports.dart';
import '../../../../../utils/utils.dart';

import 'package:provider/provider.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:landing_page/providers/scroll_provider.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;

    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsApp.colorNegroMate,
            appTheme.colorScheme.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          const DiagonalBackground(),
          Positioned(
            top: 130,
            // top: Responsive.isDesktop(context) ? 130 : 100,
            left: Responsive.isDesktop(context) ? -60 : -40,
            child: const ColumnWelcome(),
          ),
          LinesDecoration(
            angle: 104.61,
            top: 50,
            left: 670,
            height: 70,
            pixels: pixels,
          ),
          // LinesBox(
          //   angle: 104.61,
          //   top: 350,
          //   left: 500,
          //   height: 90,
          //   color: Colors.red,
          //   pixels: pixels,
          // ),
        ],
      ),
    );
  }
}
