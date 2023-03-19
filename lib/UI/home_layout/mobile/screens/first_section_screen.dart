import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/web/home_view_body/1.first_section/widgets/1.widgets_exports.dart';

import '../../../../utils/utils.dart';
// import 'package:flutter/services.dart';

//dependencies

//file addresses

class FirstSectionScreen extends StatelessWidget {
  const FirstSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizesApp.addVerticalSpace(SizesApp.padding20),
        const TextWelcomeBarber(),
        const LogoCustomForScreen(),
        SizesApp.addVerticalSpace(SizesApp.padding20),
      ],
    );
  }
}

class LogoCustomForScreen extends StatelessWidget {
  const LogoCustomForScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      color: Colors.red,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 100,
            left: -55,
            child: Image.asset(
              'assets/props/ramas.png',
              scale: 1.5,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
              bottom: 200,
              child: Image.asset('assets/logos/logo_barberia_color.png',
                  scale: 4)),
        ],
      ),
    );
  }
}
