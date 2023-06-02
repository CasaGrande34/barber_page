import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../theme/theme_changer.dart';

class DecorationLine extends StatelessWidget {
  const DecorationLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Positioned(
      top: 10,
      left: 550,
      child: Transform.rotate(
        angle: 85,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              appTheme.colorScheme.onSecondary,
              appTheme.colorScheme.background
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          height: h,
          width: 20,
        ),
      ),
    );
  }
}
