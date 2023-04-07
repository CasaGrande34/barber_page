import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ButtonAuth extends StatelessWidget {
  final bool validate;
  final RoundedLoadingButtonController controller;
  final String text;
  const ButtonAuth(this.text,
      {super.key, required this.validate, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      width: 100,
      controller: controller,
      height: 50,
      onPressed: () {
        final isValid = validate;
        if (isValid) {
          // authProvider.login(loginForm.email, loginForm.password);
          print('Aca lllegue al buttonlogin');
        }
      },
      color: Colors.amber,
      successColor: Colors.purple,
      child: Text(text),
    );
  }
}
