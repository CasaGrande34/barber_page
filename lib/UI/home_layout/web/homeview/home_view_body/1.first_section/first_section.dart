import 'dart:math';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../../../utils/spaces.dart';
import '../../../../../../utils/fonts_app.dart';
import '../../../../../../utils/colors_app.dart';
import '../../../../../../theme/theme_changer.dart';
import 'package:landing_page/providers/scroll_provider.dart';
import 'package:landing_page/UI/home_layout/web/widgets/image_listview.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Row(
          children: [
            //🔥🔥Espacio de firstSection
            Container(
              height: h,
              width: w * 0.45,
              color: appTheme.colorScheme.background,
              child: const _LeftBody(),
            ),
            Container(
              height: h,
              color: appTheme.colorScheme.background,
              width: w * 0.55,
              child: const _RightBody(),
            )
          ],
        ),
      ],
    );
  }
}

class _LeftBody extends StatefulWidget {
  const _LeftBody();

  @override
  State<_LeftBody> createState() => _LeftBodyState();
}

class _LeftBodyState extends State<_LeftBody> {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;
    return Stack(
      children: [
        Transform(
          transform: Matrix4.rotationZ(pi / 6)..translate(-180.0, 170.0),
          child: Container(
            height: 350.0,
            width: 700.0,
            decoration: BoxDecoration(
              color: appTheme.colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(300.0),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOutBack,
          top: 200.0,
          left: pixels <= 670 ? 0 : 100.0,
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('La barberia no es un trabajo, es un arte.',
                    style: FontsApp.rye),
                Text(
                    'Ahora podés reservar un cita con tu barbero favorito online. Es muy fácil, rápido y cómodo.',
                    style: FontsApp.nunito.copyWith(
                      fontSize: 24.0,
                    )),
                addVerticalSpace(20.0),
                SizedBox(
                  width: 300.0,
                  child: Text(
                    'Afeitados clásicos a navaja con toallas calientes y frias, cortes de estilo europeo, arreglos de barbas y siempre a la vanguardia.',
                    style: FontsApp.nunito.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                addVerticalSpace(30.0),
                Row(
                  children: [
                    SizedBox(
                      height: 45.0,
                      width: 230.0,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your mail address',
                          hintStyle: FontsApp.nunito,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    addHorizontalSpace(20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      child: SizedBox(
                        height: 45.0,
                        width: 100.0,
                        child: Center(
                          child: Text('Get Invite', style: FontsApp.nunito),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //ARROW DOWN
        Positioned(
          bottom: 10,
          left: 35,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: pixels > 10 ? 0.0 : 1.0,
            child: Icon(
              pixels > 10
                  ? Icons.keyboard_double_arrow_down_rounded
                  : Icons.add_alert,
              size: 40.0,
              color: appTheme.colorScheme.secondary,
            ),
          ),
        )
      ],
    );
  }
}

class _RightBody extends StatelessWidget {
  const _RightBody();

  @override
  Widget build(BuildContext context) {
    // final pixels = Provider.of<ScrollHandlerProvider>(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //Carousel de imagenes
        Positioned(
          right: 300,
          bottom: 190,
          child: Transform.rotate(
            angle: 0.35 * pi,
            child: SizedBox(
              height: 250,
              width: 900,
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      ColorsApp.colorNegroMate,
                      Colors.transparent,
                      Colors.transparent,
                      ColorsApp.colorNegroMate,
                    ],
                    stops: [0.1, 0.6, 0.5, 0.8],
                  ).createShader(bounds);
                },
                child: const ImageListView(
                  // positionIndex: 1,
                  duration: 140,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 190,
          child: Transform.rotate(
            angle: 0.35 * pi,
            child: SizedBox(
              height: 250,
              width: 900,
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      ColorsApp.colorNegroMate,
                      Colors.transparent,
                      Colors.transparent,
                      ColorsApp.colorNegroMate,
                    ],
                    stops: [0.1, 0.6, 0.5, 0.8],
                  ).createShader(bounds);
                },
                child: const ImageListView(
                  reverse: true,
                  // positionIndex: 4,
                  duration: 200,
                ),
              ),
            ),
          ),
        ),
        //BORDERS Color de fondo para las imagenes que estan en el otro stack de arriba
        // Positioned(
        //   top: 75,
        //   left: -220,
        //   child: Container(
        //     height: 80,
        //     width: 600,
        //     color: appTheme.colorScheme.background,
        //   ),
        // ),
        // Positioned(
        //   right: 65,
        //   bottom: 0,
        //   child: Container(
        //     height: 40,
        //     width: 690,
        //     color: appTheme.colorScheme.background,
        //   ),
        // ),
        Positioned(
          top: 30,
          right: 20,
          child: Transform.rotate(
            angle: 90,
            child: Image.asset(
              'assets/props/tijeras_dark.png',
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
