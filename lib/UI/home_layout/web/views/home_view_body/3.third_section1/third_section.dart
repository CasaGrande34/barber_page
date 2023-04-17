import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../theme/theme_changer.dart';
import '../../../../../../utils/colors_app.dart';
import '../../../../../../utils/fonts_app.dart';
import '../../../../../../utils/sizes_app.dart';
import '../../../../components/widgets/info_palette.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final pixels = Provider.of<ScrollHandlerProviderCustom>(context)
        .scrollController
        .position
        .pixels;
    final pixeles = pixels >= 1400 && pixels <= 2000;

    return Container(
      padding: const EdgeInsets.only(top: 160),
      height: h,
      width: w,
      color: appTheme.colorScheme.background,
      child: Stack(
        children: [
          AnimatedPositioned(
              curve: Curves.easeOutQuad,
              right: pixeles ? 0.0 : -100.0,
              duration: const Duration(milliseconds: 1200),
              child: AnimatedScale(
                curve: Curves.elasticInOut,
                duration: const Duration(milliseconds: 1200),
                scale: pixeles ? 1.0 : 0,
                child: AnimatedOpacity(
                  opacity: pixeles ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1200),
                  child: Opacity(
                    opacity: 0.25,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logos/logo_barberia_color.png',
                          fit: BoxFit.contain,
                          height: 400,
                        ),
                        SizesApp.addVerticalSpace(SizesApp.padding15),
                        Image.asset(
                          'assets/props/tijeras.png',
                          fit: BoxFit.contain,
                          height: 400,
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
            left: 20,
            child: SizedBox(
              width: 1200,
              child: Column(
                children: [
                  AnimatedScale(
                    curve: Curves.elasticInOut,
                    duration: const Duration(milliseconds: 1200),
                    scale: pixeles ? 1.0 : 0,
                    child: AnimatedOpacity(
                      opacity: pixeles ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1200),
                      child: const TitleCustomSecondSection(),
                    ),
                  ),
                  SizesApp.addVerticalSpace(40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedScale(
                        curve: Curves.elasticInOut,
                        duration: const Duration(milliseconds: 1200),
                        scale: pixeles ? 1.0 : 0,
                        child: AnimatedOpacity(
                          opacity: pixeles ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1200),
                          child: AnimatedPadding(
                            curve: Curves.easeOutQuad,
                            padding:
                                EdgeInsets.only(left: pixeles ? 0.0 : 100.0),
                            duration: const Duration(milliseconds: 1200),
                            child: const InfoPalette(
                              title: 'Cortes de pelo',
                              text:
                                  'Clásicos o modernos. Marcamos tendencia combinando máquinas y tijeras.',
                              icon: Icons.people_rounded,
                              image: 'assets/clients/2.jpg',
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 1200),
                        opacity: pixeles ? 1.0 : 0.0,
                        child: AnimatedPadding(
                          curve: Curves.easeOutQuad,
                          duration: const Duration(milliseconds: 1200),
                          padding: EdgeInsets.only(left: pixeles ? 0.0 : 100.0),
                          child: const InfoPalette(
                            title: 'Barbas',
                            text:
                                'Afeitada tradicional o recorte de barba. Contamos con el servicio de toalla caliente + asesoramiento.',
                            icon: Icons.pie_chart_rounded,
                            image: 'assets/clients/5.jpg',
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: pixeles ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1200),
                        child: AnimatedPadding(
                          curve: Curves.easeOutQuad,
                          duration: const Duration(milliseconds: 1200),
                          padding: EdgeInsets.only(left: pixeles ? 0.0 : 100.0),
                          child: const InfoPalette(
                            title: 'Niños',
                            text:
                                'Hemos trabajado para que nuestros clientes mas jovenes cuenten con un lugar donde se sientan comodos.',
                            icon: Icons.person_rounded,
                            image: 'assets/clients/9.jpg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizesApp.addVerticalSpace(60.0),
                  AnimatedScale(
                    curve: Curves.elasticInOut,
                    duration: const Duration(milliseconds: 1200),
                    scale: pixeles ? 1.0 : 0.0,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: ColorsApp.mapGrises[2]!,
                          foregroundColor: ColorsApp.mapGrises[4]!,
                          padding: const EdgeInsets.all(0.0)),
                      onPressed: onpressedDelTextButton,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: Colors.grey[800]!,
                            )),
                        child: Text('Explore more..', style: FontsApp.nunito),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onpressedDelTextButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mi cuadro de diálogo'),
          content: const Text('Este es el contenido de mi cuadro de diálogo.'),
          actions: [
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TitleCustomSecondSection extends StatelessWidget {
  const TitleCustomSecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizesApp.addHorizontalSpace(SizesApp.padding15),
        Container(
          height: 3,
          width: 25,
          color: Colors.white,
        ),
        SizesApp.addHorizontalSpace(SizesApp.padding15),
        Container(
          height: 5,
          width: 5,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
        SizesApp.addHorizontalSpace(SizesApp.padding10),
        Text(
          'Nuestros servicios',
          style: GoogleFonts.rye(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        SizesApp.addHorizontalSpace(SizesApp.padding10),
        Container(
          height: 5,
          width: 5,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
        SizesApp.addHorizontalSpace(SizesApp.padding15),
        Container(
          height: 3,
          width: 25,
          color: Colors.white,
        ),
        SizesApp.addHorizontalSpace(SizesApp.padding15),
      ],
    );
  }
}
