import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/buttons/button_blue.dart';
import '../../../utils/fonts_app.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              // DateFormat.yMMMMd().format(DateTime.now()),
              style: FontsApp.nunito.copyWith(fontSize: 19),
            ),
            const Text('Hoy'),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          width: 100,
          child: ButtonBlue(
            text: 'Turno +',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
