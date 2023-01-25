import 'dart:math';
import 'package:flutter/material.dart';
//dependencies
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
//file addresses
import '../../../../../../theme/theme_changer.dart';
import '../../../../../../utils/spaces.dart';
import '../../../../../../theme/theme_changer.dart';
import '../../../widgets/header/header.dart';
import 'package:landing_page/UI/home_layout/web/widgets/image_listview.dart';

class FirstSection extends StatefulWidget {
  final double pixels;
  const FirstSection({
    Key? key,
    required this.pixels,
  }) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
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
              height: 753.0,
              width: w * 0.45,
              color: appTheme.colorScheme.background,
              child: _LeftBody(widget: widget),
            ),
            Container(
              height: 753.0,
              color: appTheme.colorScheme.background,
              width: w * 0.55,
              child: _RightBody(widget: widget),
            )
          ],
        ),
        Header(pixels: widget.pixels),
      ],
    );
  }
}

class _LeftBody extends StatelessWidget {
  const _LeftBody({
    super.key,
    required this.widget,
  });

  final FirstSection widget;

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Stack(
      children: [
        Transform(
          transform: Matrix4.rotationZ(pi / 6)..translate(-180.0, 170.0),
          child: Container(
            height: 350.0,
            width: 700.0,
            decoration: BoxDecoration(
                color: appTheme.colorScheme.onBackground,
                borderRadius: BorderRadius.circular(300.0)),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutBack,
          top: 200.0,
          left: widget.pixels < 480 ? 100.0 : 0,
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'La barberia no es un trabajo, es un arte.',
                  style: GoogleFonts.rye(
                    fontSize: 38.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Ahora podés reservar un cita con tu barbero favorito online. Es muy fácil, rápido y cómodo.',
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                addVerticalSpace(20.0),
                SizedBox(
                  width: 300.0,
                  child: Text(
                    'Afeitados clásicos a navaja con toallas calientes y frias, cortes de estilo europeo, arreglos de barbas y siempre a la vanguardia.',
                    style: GoogleFonts.nunito(
                        fontSize: 14.0, fontWeight: FontWeight.w300),
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
                            hintStyle: GoogleFonts.nunito(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),
                      ),
                    ),
                    addHorizontalSpace(20.0),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                      onPressed: () {},
                      child: SizedBox(
                        height: 45.0,
                        width: 100.0,
                        child: Center(
                          child: Text(
                            'Get Invite',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RightBody extends StatelessWidget {
  const _RightBody({
    super.key,
    required this.widget,
  });

  final FirstSection widget;

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 300,
          bottom: 190,
          child: Transform.rotate(
            angle: 0.35 * pi,
            child: const SizedBox(
              height: 250,
              width: 790,
              child: ImageListView(
                startIndex: 1,
                duration: 140,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 190,
          child: Transform.rotate(
            angle: 0.35 * pi,
            child: const SizedBox(
              height: 250,
              width: 790,
              child: ImageListView(
                startIndex: 2,
                duration: 200,
              ),
            ),
          ),
        ),

        //  Positioned(
        //   left: -120,
        //   child: ImageListView(startIndex: 1, duration: 60)),

        //  Positioned(
        //   left: 190,
        //   child: ImageListView(startIndex: 2, duration: 50)),

        Positioned(
          top: 75,
          left: -150,
          child: Container(
            height: 70,
            width: 600,
            color: appTheme.colorScheme.background,
            // color: Colors.blueGrey,
            child: Image.asset(
              'assets/decoration/border_top.png',
              alignment: Alignment.center,
            ),
          ),
        ),

        Positioned(
          right: 10,
          bottom: 0,
          child: Container(
            height: 40,
            width: 690,
            color: appTheme.colorScheme.background,
            // color: Colors.blueGrey,
            child: Image.asset('assets/decoration/border_bottom.png',
                width: double.infinity, alignment: Alignment.center),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 35,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: widget.pixels > 100 ? 0.0 : 1.0,
              child: Icon(
                Icons.keyboard_double_arrow_down_rounded,
                size: 40.0,
                color: appTheme.colorScheme.secondary,
              ),
            ))
      ],
    );
  }
}
