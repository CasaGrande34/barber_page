import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AuthTitleText extends StatelessWidget {
  final String text;
  const AuthTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FontsApp.rye,
    );
  }
}
