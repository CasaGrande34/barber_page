import 'package:flutter/material.dart';
//dependencies
//🔥🔥🔥PROBAMOS PAQUETE WEB
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
//file addresses
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/2.second_section/second_section.dart';
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/6.six_section/six_section.dart';
import '1.first_section/first_section.dart';
import '5.five_section/five_section.dart';
import '3.third_section/third_section.dart';
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/4.fourt_section/fourt_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  double pixels = 0.0;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        pixels = scrollController.position.pixels;
        // print( scrollController.position.maxScrollExtent );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            //Primera Seccion.
            const FirstSection(),
            /*	------------------------------------- */
            //?Segunda Seccion
            SecondSection(pixels: pixels),
            /*	------------------------------------- */
            //?Tercera Seccion.
            ThirdSection(pixels: pixels),
            /*	------------------------------------- */
            //?Cuarta Seccion.
            FourtSection(pixels: pixels),
            /*	------------------------------------- */
            //? Quinta Seccion.
            const FiveSection(),
            /*	------------------------------------- */
            //Sexta Seccion.
            const SixSection()
          ],
        ),
      ),
    );
  }
}
