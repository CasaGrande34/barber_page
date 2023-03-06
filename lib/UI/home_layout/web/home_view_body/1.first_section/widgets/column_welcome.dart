import 'package:flutter/material.dart';

import '../../../../../../utils/utils.dart';

import 'package:landing_page/UI/home_layout/web/home_view_body/1.first_section/widgets/text_welcome_barber.dart';
import 'item_flotante.dart';

class ColumnWlecome extends StatelessWidget {
  const ColumnWlecome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextWelcomeBarber(),
        SizesApp.addVerticalSpace(SizesApp.padding20),
        const ItemFlotante(),
      ],
    );
  }
}
