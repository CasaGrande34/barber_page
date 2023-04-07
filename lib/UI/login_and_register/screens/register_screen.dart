import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:provider/provider.dart';

import '../../../providers/login_form_provider.dart';
import '../../../providers/register_form_provider.dart';
import '../../../utils/utils.dart';
import '../components/auth_components_exports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChangerButton = Provider.of<ThemeCharger>(context);
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerForm = Provider.of<RegisterFormProvider>(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: themeChangerButton.toggleTheme,
              icon: (themeChangerButton.isDark == true)
                  ? Icon(FontAwesomeIcons.moon,
                      color: appTheme.colorScheme.primary)
                  : const Icon(FontAwesomeIcons.sun),
            ),
            title: const Text('RegisterScreen'),
            centerTitle: true,
          ),
          body: Form(
            key: registerForm.registerFormKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizesApp.addVerticalSpace(100),
                    const AuthTitleText(
                      text: 'Register',
                    ),
                    const Spacer(),
                    const _BoxRegisterField(),
                    SizesApp.addVerticalSpace(SizesApp.padding10),
                    ButtonAuth(
                      'Registrarse',
                      controller: registerForm.buttonController,
                      validate: registerForm.validateForm(),
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

class _BoxRegisterField extends StatelessWidget {
  const _BoxRegisterField();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final emailController = TextEditingController();
    final registerForm = Provider.of<RegisterFormProvider>(context);

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
        onChanged: (value) => registerForm.email = value,
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
        children: List.from(textFormFields),
      ),
    );
  }
}
