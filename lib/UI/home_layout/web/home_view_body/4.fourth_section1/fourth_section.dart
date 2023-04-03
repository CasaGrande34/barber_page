import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/UI/home_layout/web/home_view_body/4.fourth_section1/widgets/reserva_turno.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/scroll_provider.dart';
import '../../../../../utils/sizes_app.dart';
import '../../../../../utils/utils.dart';
import '../../widgets/solo_icon.dart';
import '../../widgets/slider_custom.dart';

class FourthSection extends StatefulWidget {
  final double? pixels;
  const FourthSection({
    Key? key,
    this.pixels = 0.0,
  }) : super(key: key);

  @override
  State<FourthSection> createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final pixels = Provider.of<ScrollHandlerProviderCustom>(context)
        .scrollController
        .position
        .pixels;
    final pixeles = pixels >= 2050 && pixels <= 2860;
    return Container(
      height: h,
      width: w,
      color: appTheme.colorScheme.background,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 180,
            left: -250.0,
            child: Container(
              height: 450.0,
              width: 700.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 36, 36),
                borderRadius: BorderRadius.circular(400.0),
              ),
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  'assets/decoration/fondo_barber.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutQuad,
            top: 170.0,
            left: pixeles ? 70.0 : 20.0,
            child: Container(
              height: 400.0,
              width: 700.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: const SliderCustom(),
            ),
          ),
          Positioned(
            top: 150.0,
            left: 50.0,
            child: AnimatedScale(
              curve: Curves.easeInSine,
              scale: pixeles ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 700),
              child: const SoloIcon(
                icon: Icons.arrow_circle_left,
                factor: 1.0,
              ),
            ),
          ),
          Positioned(
            top: 540.0,
            left: 750.0,
            child: AnimatedScale(
              curve: Curves.easeInSine,
              scale: pixeles ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 700),
              child: const SoloIcon(
                icon: Icons.arrow_circle_right,
                factor: 1.0,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.decelerate,
            right: pixeles ? 150.0 : 5.0,
            top: 150.0,
            child: const ReservaTurno(),
          ),
        ],
      ),
    );
  }
}
