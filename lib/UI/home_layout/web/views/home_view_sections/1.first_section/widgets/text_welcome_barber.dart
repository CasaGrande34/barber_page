import 'package:flutter/material.dart';

import '../../../../../../../utils/utils.dart';

class TextWelcomeBarber extends StatelessWidget {
  const TextWelcomeBarber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    final textWidthDesktop = w * .013;

    return Text(
      '''¡Bienvenido a nuestra barbería virtual en Argentina! 
                  Donde el estilo y la elegancia se combinan para brindarte la mejor experiencia de cuidado personal.\t 
                  Nuestros barberos expertos están aquí para ayudarte a lograr el corte y estilo de barba perfectos, reserva tu turno. 
                  
      ¡Gracias por elegirnos y esperamos verte pronto!''',
      textAlign: TextAlign.center,
      style: FontsApp.nunito.copyWith(
          fontSize: textWidthDesktop,
          decorationStyle: TextDecorationStyle.dotted),
    );
  }
}
