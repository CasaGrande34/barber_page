import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:landing_page/providers/dialog_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/buttons/button_blue.dart';
import '../../../utils/fonts_app.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DialogProvider>(context, listen: false).setContext(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dialog = Provider.of<DialogProvider>(context);
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
            onPressed: dialog.show,
          ),
        )
      ],
    );
  }
}
