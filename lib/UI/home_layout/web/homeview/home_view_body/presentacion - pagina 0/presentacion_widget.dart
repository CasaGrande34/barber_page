import 'package:flutter/material.dart';

import '../../../../../../utils/fonts_app.dart';
import '../../../../../../utils/sizes_app.dart';

import 'package:provider/provider.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:landing_page/providers/scroll_provider.dart';

class Presentacion extends StatefulWidget {
  const Presentacion({super.key});

  @override
  State<Presentacion> createState() => _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;

    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            appTheme.colorScheme.secondary,
            appTheme.colorScheme.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          const FondoStackPresentation(),
          const DescriptionPresentation(),
          LineasDecorationPresentation(
            angle: 104.61,
            top: 50,
            left: 670,
            height: 70,
            pixels: pixels,
          ),
          LineasContainerPresentation(
            angle: 104.61,
            top: 300,
            left: 400,
            height: 90,
            color: Colors.red,
            pixels: pixels,
          ),
        ],
      ),
    );
  }
}

class DescriptionPresentation extends StatelessWidget {
  const DescriptionPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextPresentation(),
        SizesApp.addVerticalSpace(SizesApp.padding20),
        const IconFlotante(),
      ],
    );
  }
}

class LineasDecorationPresentation extends StatelessWidget {
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final double angle;
  final double pixels;
  const LineasDecorationPresentation({
    super.key,
    required this.top,
    required this.left,
    required this.height,
    this.width = 2.0,
    this.color = Colors.white,
    this.angle = 30,
    required this.pixels,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) => Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Transform.scale(
            scale: value,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding15),
                Container(
                  height: 100,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding25),
                Container(
                  height: 30,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding20),
                Container(
                  height: 80,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineasContainerPresentation extends StatelessWidget {
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final double angle;
  final double pixels;
  const LineasContainerPresentation({
    super.key,
    required this.top,
    required this.left,
    required this.height,
    this.width = 2.0,
    this.color = Colors.white,
    this.angle = 30,
    required this.pixels,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) => Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Transform.scale(
            scale: value,
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(50),
                Container(
                  height: 50,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding25),
                Container(
                  height: 100,
                  width: width,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding20),
                Container(
                  height: 100,
                  width: 300,
                  color: color,
                ),
                SizesApp.addVerticalSpace(SizesApp.padding30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextPresentation extends StatelessWidget {
  const TextPresentation({
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
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: appTheme.colorScheme.onPrimary),
      ),
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

class IconFlotante extends StatefulWidget {
  const IconFlotante({
    super.key,
  });

  @override
  State<IconFlotante> createState() => _IconFlotanteState();
}

class _IconFlotanteState extends State<IconFlotante>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..forward()
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Container(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0 * animationController.value),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: Transform.rotate(
              angle: 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/props/tijeras.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FondoStackPresentation extends StatelessWidget {
  const FondoStackPresentation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Stack(
      children: [
        ClipPath(
          clipper: DiagonalClipper(),
          child:
              Image.asset('assets/clients/10.jpg', width: w, fit: BoxFit.cover),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                appTheme.colorScheme.background,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: const [0.2, 0.9],
            ),
          ),
        )
      ],
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 500, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DecorationLinea extends StatelessWidget {
  const DecorationLinea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Positioned(
      top: 10,
      left: 550,
      child: Transform.rotate(
        angle: 85,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              appTheme.colorScheme.onSecondary,
              appTheme.colorScheme.background
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          height: h,
          width: 20,
        ),
      ),
    );
  }
}
