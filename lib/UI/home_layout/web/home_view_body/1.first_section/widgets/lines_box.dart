import 'package:flutter/material.dart';

import '1.widgets_exports.dart';

class LinesBox extends StatelessWidget {
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final double angle;
  final double pixels;
  const LinesBox({
    super.key,
    required this.top,
    required this.left,
    required this.height,
    this.width = 2.0,
    this.color = Colors.white,
    this.angle = 30,
    required this.pixels,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) => Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Transform.scale(
            scale: value,
            child: const ContainerAnimation(),
          ),
        ),
      ),
    );
  }
}
