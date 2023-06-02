import 'package:flutter/material.dart';


import 'package:landing_page/UI/home_layout/sections/1.first_section/widgets/text_welcome_barber.dart';
import 'item_flotante.dart';

class ColumnWelcome extends StatelessWidget {
  const ColumnWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h * .5,
      width: w * .5,
      child: Column(
        children: const [
          TextWelcomeBarber(),
          ItemFlotante(),
        ],
      ),
    );
  }
}
