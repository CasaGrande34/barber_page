import 'package:flutter/material.dart';

class TijerasItem extends StatelessWidget {
  const TijerasItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90,
      child: Image.asset(
        'assets/props/tijeras_dark.png',
        width: 200,
      ),
    );
  }
}
