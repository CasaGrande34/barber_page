import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/sizes_app.dart';

class FiveSection extends StatelessWidget {
  const FiveSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          color: appTheme.colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(200),
          )),
      child: Stack(
        children: [
          Align(
            child: Column(
              children: [
                SizesApp.addVerticalSpace(15),
                Text(
                  'NUESTRO EQUIPO',
                  style: GoogleFonts.rye(
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  'Un grupo de profesionales altamente capacitados estarán siempre detrás de cada necesidad planteada por nuestros clientes.',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                SizesApp.addVerticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/props/barber_pole_brazo_inverso.png',
                          height: 320,
                        ),
                        SizesApp.addHorizontalSpace(10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'NEWSLETTER',
                              style: GoogleFonts.rye(
                                fontWeight: FontWeight.w800,
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: w * .15,
                              child: const Text(
                                'Te mantenemos informado para que no te pierdas las últimas novedades de Shelby BarberShop.',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ClipOval(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'assets/clients/8.jpg',
                        width: w * .25,
                        height: h * .65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'OBTENE TU GIF CARD',
                              style: GoogleFonts.rye(
                                fontWeight: FontWeight.w800,
                                fontSize: 25.0,
                              ),
                            ),
                            // Text('hola'),
                          ],
                        ),
                        SizesApp.addVerticalSpace(10),
                        Image.asset(
                          'assets/props/barber_pole_brazo.png',
                          height: 320,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
