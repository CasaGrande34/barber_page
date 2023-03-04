import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:landing_page/providers/scroll_provider.dart';

import '../../../../../../utils/colors_app.dart';
import '../../../../../../utils/fonts_app.dart';
import '../../../../../../utils/sizes_app.dart';

class Presentacion extends StatefulWidget {
  const Presentacion({super.key});

  @override
  State<Presentacion> createState() => _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  double initialHeight = 0.0;
  double initialWidth = 0.0;

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
          Column(
            children: [
              Row(
                children: const [
                  LeftBody(),
                  RightBody(),
                ],
              ),
            ],
          ),
          ColumnaLineasDecorationPresentation(
            pixels: pixels,
            top: 250,
            left: 590,
            height: 30,
            angle: 107.24,
            color: appTheme.colorScheme.onBackground,
          ),
          ColumnaLineasDecorationPresentation(
            pixels: pixels,
            top: 50,
            left: 740,
            height: 22,
            angle: 107.24,
            color: appTheme.colorScheme.onBackground,
          )
        ],
      ),
    );
  }
}

class LeftBody extends StatelessWidget {
  const LeftBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndDescriptionPresentation(),
        SizesApp.addVerticalSpace(SizesApp.padding20),
        const IconFlotante(),
      ],
    );
  }
}

class ColumnaLineasDecorationPresentation extends StatelessWidget {
  final double top;
  final double left;
  final double height;
  final double width;
  final Color color;
  final double angle;
  final double pixels;
  const ColumnaLineasDecorationPresentation({
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
      duration: const Duration(milliseconds: 3000),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: height),
      builder: (context, value, child) => Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Column(
            children: [
              AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 500),
                height: pixels > 100 ? 0 : value + 50,
                width: width,
                color: color,
              ),
              SizesApp.addVerticalSpace(SizesApp.padding15),
              AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 500),
                height: pixels > 100 ? 0 : value + 100,
                width: width,
                color: color,
              ),
              SizesApp.addVerticalSpace(SizesApp.padding25),
              AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 500),
                height: pixels > 100 ? 0 : value + 30,
                width: width,
                color: color,
              ),
              SizesApp.addVerticalSpace(SizesApp.padding20),
              AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 500),
                height: pixels > 100 ? 0 : value + 80,
                width: width,
                color: color,
              ),
              SizesApp.addVerticalSpace(SizesApp.padding30),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndDescriptionPresentation extends StatelessWidget {
  const TitleAndDescriptionPresentation({
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

class RightBody extends StatelessWidget {
  const RightBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return ClipPath(
      clipBehavior: Clip.antiAlias,
      clipper: DiagonalClipper(),
      child: SizedBox(
        width: w,
        height: h,
        child: Stack(
          children: [
            const FadeInImage(
              placeholder: NetworkImage(
                  'https://media.giphy.com/media/cIbJ5bBlNLxynVGYzb/giphy.gif'),
              image: AssetImage('assets/clients/10.jpg'),
              fit: BoxFit.contain,
              alignment: Alignment.center,
              placeholderFit: BoxFit.contain,
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
                  stops: const [0.2, 0.8],
                ),
              ),
            )
          ],
        ),
      ),
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
    path.lineTo(size.width, 0);
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
