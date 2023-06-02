import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class LinesDecoration extends StatelessWidget {
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final double angle;
  final double pixels;
  const LinesDecoration({
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
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding15),
                Container(
                  height: 100,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding25),
                Container(
                  height: 30,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding20),
                Container(
                  height: 80,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
