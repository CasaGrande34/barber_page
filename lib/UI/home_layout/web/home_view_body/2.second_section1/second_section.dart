import 'package:flutter/material.dart';

import 'widgets/2.widgets_exports.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Row(
          children: const [LeftBody(), RightBody()],
        ),
      ],
    );
  }
}
