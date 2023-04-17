import 'package:flutter/material.dart';

class SoloIcon extends StatelessWidget {
  final double factor;
  final IconData icon;
  final void Function()? onPressed;

  const SoloIcon({
    Key? key,
    required this.factor,
    required this.icon,
    required this.onPressed,
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
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: Colors.black,
        ),
      ),
    );
  }
}
