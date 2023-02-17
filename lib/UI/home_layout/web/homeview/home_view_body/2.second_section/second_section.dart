import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//file addresses
import '../../../../../../theme/theme_changer.dart';
import '../../../../../../utils/spaces.dart';
import '../../../widgets/info_palette.dart';

class SecondSection extends StatefulWidget {
  final double? pixels;
  const SecondSection({
    Key? key,
    this.pixels = 0.0,
  }) : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      color: appTheme.colorScheme.background,
      child: Stack(
        children: [
          // Positioned(
          //   right: -200.0,
          //   child: Container(
          //     height: 330.0,
          //     width: 430.0,
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(300.0),
          //     ),
          //   ),

          // ),
          AnimatedPositioned(
              curve: Curves.easeOutQuad,
              right:
                  widget.pixels! >= 120 && widget.pixels! < 930 ? 0.0 : -100.0,
              duration: const Duration(milliseconds: 700),
              child: AnimatedOpacity(
                opacity:
                    widget.pixels! >= 120 && widget.pixels! < 930 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 700),
                child: Opacity(
                  opacity: 0.25,
                  child: Image.asset(
                    'assets/logos/logo_barberia_color.png',
                    fit: BoxFit.contain,
                    height: 340,
                  ),
                ),
              )),
          Column(
            children: [
              Text(
                'Nuestros servicios',
                style: GoogleFonts.rye(
                    fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              addVerticalSpace(40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedOpacity(
                    opacity: widget.pixels! >= 120 && widget.pixels! < 930
                        ? 1.0
                        : 0.0,
                    duration: const Duration(milliseconds: 650),
                    child: AnimatedPadding(
                      curve: Curves.easeOutQuad,
                      padding: EdgeInsets.only(
                          left: widget.pixels! >= 120 && widget.pixels! < 930
                              ? 0.0
                              : 100.0),
                      duration: const Duration(milliseconds: 650),
                      child: const InfoPalette(
                        title: 'Cortes de pelo',
                        text:
                            'Clásicos o modernos. Marcamos tendencia combinando máquinas y tijeras.',
                        icon: Icons.people_rounded,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 650),
                    opacity: widget.pixels! >= 120 && widget.pixels! < 930
                        ? 1.0
                        : 0.0,
                    child: AnimatedPadding(
                      curve: Curves.easeOutQuad,
                      duration: const Duration(milliseconds: 650),
                      padding: EdgeInsets.only(
                          left: widget.pixels! >= 120 && widget.pixels! < 930
                              ? 0.0
                              : 100.0),
                      child: const InfoPalette(
                        title: 'Barbas',
                        text:
                            'Afeitada tradicional o recorte de barba. Contamos con el servicio de toalla caliente + asesoramiento.',
                        icon: Icons.pie_chart_rounded,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: widget.pixels! >= 120 && widget.pixels! < 930
                        ? 1.0
                        : 0.0,
                    duration: const Duration(milliseconds: 650),
                    child: AnimatedPadding(
                      curve: Curves.easeOutQuad,
                      duration: const Duration(milliseconds: 650),
                      padding: EdgeInsets.only(
                          left: widget.pixels! >= 120 && widget.pixels! < 930
                              ? 0.0
                              : 100.0),
                      child: const InfoPalette(
                        title: 'Niños',
                        text:
                            'Hemos trabajado para que nuestros clientes mas jovenes cuenten con un lugar donde se sientan comodos.',
                        icon: Icons.person_rounded,
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(60.0),
              AnimatedScale(
                curve: Curves.elasticInOut,
                duration: const Duration(milliseconds: 1200),
                scale: widget.pixels! > 270 && widget.pixels! < 950 ? 1.0 : 0.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.all(0.0)),
                  onPressed: () {},
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
                    child: Text(
                      'Explore more..',
                      style: GoogleFonts.nunito(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
