import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  //boton del register y login para manejar la autenticacion
  RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  LoginFormProvider();

  bool validateForm() {
    if (loginFormKey.currentState!.validate()) {
      Timer(const Duration(milliseconds: 2500), () {
        buttonController.success();
        Timer(const Duration(milliseconds: 1200), () {
          buttonController.reset();
          // print('form valid');
          // print('$email ===== $password');
        });
      });
      buttonController.success();
      return true;
    } else {
      Timer(const Duration(seconds: 3), () {
        buttonController.error();
        Timer(const Duration(milliseconds: 1700), () {
          buttonController.reset();
        });
      });
      return false;
    }
  }
}
