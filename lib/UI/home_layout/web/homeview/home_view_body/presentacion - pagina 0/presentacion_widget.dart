import 'package:flutter/material.dart';

class Presentacion extends StatelessWidget {
  const Presentacion({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      color: Colors.blueGrey,
    );
  }
}
