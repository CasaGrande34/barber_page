import 'package:flutter/material.dart';

import '1.widgets_exports.dart';

import 'package:provider/provider.dart';
import '../../../../../theme/theme_changer.dart';

class DiagonalBackground extends StatelessWidget {
  const DiagonalBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Stack(
      children: [
        ClipPath(
          clipper: DiagonalClipper(context),
          child: Image.asset('assets/clients/10.jpg',
              width: w, height: h, fit: BoxFit.cover),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: linearGradientCustom(appTheme),
          ),
        )
      ],
    );
  }

  LinearGradient linearGradientCustom(appTheme) {
    return LinearGradient(
      colors: [
        Colors.transparent,
        appTheme.colorScheme.background,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      stops: const [0.2, 0.9],
    );
  }
}
