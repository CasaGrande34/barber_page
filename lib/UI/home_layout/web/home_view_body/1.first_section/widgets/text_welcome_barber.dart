import 'package:flutter/material.dart';

import '../../../../../../utils/utils.dart';

import 'package:provider/provider.dart';
import '../../../../../../theme/theme_changer.dart';

class TextWelcomeBarber extends StatelessWidget {
  const TextWelcomeBarber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    return Container(
      margin: const EdgeInsets.only(left: SizesApp.padding20),
      padding: const EdgeInsets.all(SizesApp.padding5),
      height: 195,
      width: 480,
      child: Text(
        '''¡Bienvenido a nuestra barbería virtual en Argentina! 
                    Donde el estilo y la elegancia se combinan para brindarte la mejor experiencia de cuidado personal.\t 
                    Nuestros barberos expertos están aquí para ayudarte a lograr el corte y estilo de barba perfectos, reserva tu turno. 
                    
        ¡Gracias por elegirnos y esperamos verte pronto!''',
        textAlign: TextAlign.center,
        style: FontsApp.nunito.copyWith(
            fontSize: 16, decorationStyle: TextDecorationStyle.dotted),
      ),
    );
  }
}
