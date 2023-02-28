import 'package:flutter/material.dart';

import '../../../../../../utils/styles.dart';

class Presentacion extends StatelessWidget {
  const Presentacion({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      color: Styles.colorBackgroundScaffold2,
      child: Stack(
        children: [
          Positioned(
            child: Text('Shelby Barber'),
          ),
          RightBody(),
          const DecorationLinea()
        ],
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  const RightBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: -80,
      child: Transform.rotate(
        angle: 85,
        child: Container(
          color: Colors.black,
          height: 1400,
          width: 1000,
        ),
      ),
    );
  }
}

class DecorationLinea extends StatelessWidget {
  const DecorationLinea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 550,
      child: Transform.rotate(
        angle: 85,
        child: Container(
          color: Colors.black,
          height: 1400,
          width: 20,
        ),
      ),
    );
  }
}
