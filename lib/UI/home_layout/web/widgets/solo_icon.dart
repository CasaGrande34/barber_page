import 'package:flutter/material.dart';
//dependencies
//file addresses

class SoloIcon extends StatelessWidget {
  final double factor;
  final double pixels;
  final IconData icon;

  const SoloIcon({
    Key? key,
    required this.factor,
    required this.icon,
    this.pixels = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0 * factor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black87,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 5.0 * factor),
            blurRadius: 5.0 * factor,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 12.0 * factor,
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          size: 25.0 * factor,
          color: Colors.black,
        ),
      ),
    );
  }
}
