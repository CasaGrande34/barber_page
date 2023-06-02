import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/utils.dart';
import '../../../theme/theme_changer.dart';
import '../components/auth_components_exports.dart';
import 'package:landing_page/providers/login_form_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChangerButton = Provider.of<ThemeCharger>(context);
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginForm =
            Provider.of<LoginFormProvider>(context, listen: false);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: themeChangerButton.toggleTheme,
              icon: (themeChangerButton.isDark == true)
                  ? Icon(FontAwesomeIcons.moon,
                      color: appTheme.colorScheme.primary)
                  : const Icon(FontAwesomeIcons.sun),
            ),
            title: const Text('LoginScreen'),
            centerTitle: true,
          ),
          body: Form(
            key: loginForm.loginFormKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizesApp.addVerticalSpace(100),
                    const AuthTitleText(text: 'Login'),
                    const Spacer(),
                    const _BoxLoginField(),
                    SizesApp.addVerticalSpace(SizesApp.padding10),
                    ButtonAuth(
                      'Ingresar',
                      controller: loginForm.buttonController,
                      validate: loginForm.validateForm(),
                    ),
                    SizesApp.addVerticalSpace(140),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _BoxLoginField extends StatelessWidget {
  const _BoxLoginField();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final emailController = TextEditingController();
    final loginForm = Provider.of<LoginFormProvider>(context);

    final List<Widget> textFormFields = [
      TextFormField(
        controller: emailController,
        validator: (value) {
          //CONDICIONES DEL VALIDADOR
          if (!EmailValidator.validate(value ?? '')) {
            return 'Email no valido';
          }
          return null;
        },
        decoration: StylesApp.inputDecorationEmail,
        onChanged: (value) => loginForm.email = value,
      ),
      SizedBox(
        height: w * 0.08,
        width: w * 0.8,
        child: const Placeholder(
          color: Colors.white,
        ),
      ),
    ];

    var condition = textFormFields.length <= 2;

    return Container(
      padding: const EdgeInsets.all(SizesApp.padding15),
      height: condition ? h * 0.2 : h * 0.3,
      width: w * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizesApp.padding15),
        color: Colors.brown,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.from(textFormFields)),
    );
  }
}
