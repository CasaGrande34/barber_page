import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

//dependencies
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
//file addresses
import 'package:landing_page/UI/home_layout/web/homeview/homeview.dart';
import 'package:provider/provider.dart';

class FirstSplashView extends StatefulWidget {
  const FirstSplashView({super.key});

  @override
  State<FirstSplashView> createState() => _FirstSplashViewState();
}

class _FirstSplashViewState extends State<FirstSplashView> {
  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  late Timer timer1;
  late Timer timer2;
  late Timer timer3;
  late Timer timer4;
  late Timer timer5;
  late Timer timer6;

  @override
  void initState() {
    super.initState();

    timer1 = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    timer2 = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    timer3 = Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    timer4 = Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    timer5 = Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    timer6 = Timer(const Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(route: const SecondSplashView()),
        );
      });
    });
  }

  @override
  void dispose() {
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
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2.1
                      : 230,
              width: 230,
              child: Image.asset('assets/logos/logo_barberia_color.png'),
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 200
                          : 20),
              decoration: BoxDecoration(
                  // color: _b ? Colors.white : Colors.transparent,
                  borderRadius:
                      _d ? BorderRadius.only() : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Shelby Barber',
                            duration: const Duration(
                              milliseconds: 1700,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget? route;
  ThisIsFadeRoute({this.page, this.route})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page!,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: route,
                ));
}

class SecondSplashView extends StatefulWidget {
  const SecondSplashView({super.key});

  @override
  State<SecondSplashView> createState() => _SecondSplashViewState();
}

class _SecondSplashViewState extends State<SecondSplashView> {
  late Timer timer1;
  late int _currentIndex;
  List<String> _carouselImages = [
    'assets/splash/1.jpg',
    'assets/splash/2.jpg',
    'assets/splash/3.jpg',
    'assets/splash/4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    // timer1 = Timer(const Duration(milliseconds: 6000), () {
    //   setState(() {
    //     Navigator.of(context)
    //         .pushReplacement(ThisIsFadeRoute(route: const HomeView()));
    //   });
    // });
  }

  @override
  void dispose() {
    timer1.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 2500),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.fastOutSlowIn,
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black, Colors.transparent, Colors.black],
                  ).createShader(rect);
                },
                child: SizedBox(
                    height: h,
                    width: w,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        autoPlayCurve: Curves.easeInOutQuint,
                        autoPlay: true,
                        autoPlayInterval: Duration(milliseconds: 3500),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        viewportFraction: 0.5,
                        // aspectRatio: 2.0,
                        // enlargeCenterPage: true,
                      ),
                      items: _carouselImages
                          .map((e) => Image.asset(
                                e,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                    )),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              color: Colors.grey.withOpacity(0.0),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 700,
              width: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  height: 700,
                  initialPage: _currentIndex,
                  viewportFraction: 0.4,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInOutQuint,
                  autoPlay: true,
                  autoPlayInterval: Duration(milliseconds: 3400),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                ),
                items: _carouselImages
                    .map((e) => ClipRRect(
                          child: Image.asset(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Positioned(
            top: h / 3,
            right: w / 3.4,
            child: SizedBox(
              height: 200,
              width: 300,
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    // duration: const Duration(milliseconds: 6000),
                    '''Agradecidos estos 7 años al servicio de nuestros clientes Nuestra mision es brindarle la mejor experiencia
                      
                      ''',
                    textStyle: GoogleFonts.rye(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
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
}
