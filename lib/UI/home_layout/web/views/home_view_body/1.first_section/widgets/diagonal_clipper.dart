import 'package:flutter/material.dart';

import '../../../../../../../utils/responsive.dart';

class DiagonalClipper extends CustomClipper<Path> {
  final BuildContext context;

  DiagonalClipper(this.context);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(
        Responsive.isDesktop(context) ? size.width - 300 : size.width - 250, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
