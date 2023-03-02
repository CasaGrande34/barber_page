import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:landing_page/UI/home_layout/web/homeview/homeview.dart';

import '../../../utils/fonts_app.dart';

/* 
ESTUVO HACIENDO PRUEBAS PARA PROBAR LA APP EN LA WEB Y EN EL CELU Y AL PARECER CUADNO LLAMO AL SPLASHVIEW PASO DIRECTAMENTE
AL HOMEVIEW Y NO PASO POR EL HOMELAYOUT, VOY A CAMBIARLO AHORA PARA HACER LAS PRUEBBAS 🔥🔥🔥  
 */

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  bool e = false;

  late Timer timer1;
  late Timer timer2;
  late Timer timer3;
  late Timer timer4;
  late Timer timer5;
  late Timer timer6;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween<double>(begin: -50, end: 2000).animate(_controller);

    timer1 = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        a = true;
      });
    });
    timer2 = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        b = true;
      });
    });
    timer3 = Timer(const Duration(milliseconds: 1800), () {
      setState(() {
        c = true;
        _controller.forward();
      });
    });
    timer4 = Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        e = true;
      });
    });
    timer5 = Timer(const Duration(milliseconds: 7000), () {
      setState(() {
        d = true;
      });
    });
    timer6 = Timer(const Duration(milliseconds: 9000), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            begin: const Offset(0.0, 1.0),
            route: const HomeView(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    timer1.cancel();
    timer2.cancel();
    timer3.cancel();
    timer4.cancel();
    timer5.cancel();
    timer6.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    // final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                //LOGO 🔥🔥
                AnimatedContainer(
                  duration: Duration(milliseconds: d ? 2400 : 4500),
                  curve: d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
                  height: d
                      ? 0
                      : a
                          ? h / 2.1
                          : 0,
                  width: 230,
                  child: Image.asset('assets/logos/logo_barberia_color.png'),
                ),
                //SHELBY BARBER TEXT .🔥🔥
                AnimatedContainer(
                  duration: Duration(
                      milliseconds: d
                          ? 4500
                          : c
                              ? 3200
                              : 2000),
                  child: Center(
                    child: e
                        ? AnimatedTextKit(
                            animatedTexts: [
                              FadeAnimatedText('Shelby Barber',
                                  duration: const Duration(
                                    milliseconds: 3000,
                                  ),
                                  textStyle: FontsApp.oldStandardTt),
                              FadeAnimatedText('Bienvenido...',
                                  duration: const Duration(
                                    milliseconds: 2500,
                                  ),
                                  textStyle: FontsApp.oldStandardTt),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget? route;
  Offset begin;
  ThisIsFadeRoute({required this.begin, this.page, this.route})
      : super(
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                page!,
            transitionDuration: const Duration(milliseconds: 3000),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);
              return SlideTransition(
                position: Tween(begin: begin, end: const Offset(0.0, 0.0))
                    .animate(animation),
                child: route,
              );
            });
}
