import 'package:flutter/material.dart';
//dependencies
//🔥🔥🔥PROBAMOS PAQUETE WEB
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
//file addresses
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/1.first_section/first_section.dart';
// import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/5.five_section/five_section.dart';
// import '4.fourth_section/fourth_section.dart';
import '2.second_section/second_section.dart';
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/3.third_section/third_section.dart';

//Global var
double pixelsSCroll = 0.0;

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  int index = 0;
  // double pixelsScroll = 0.0;
  // double positionOffset = .0;
  // double positionOffsetHeight = 753.59;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      initStatePixels(context);
      // setState(() {});
    });
    super.initState();
  }

  void initStatePixels(BuildContext context) {
    setState(() {
      pixelsSCroll = scrollController.position.pixels;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: containerWidget
              .asMap()
              .map(
                (i, widget) => MapEntry(
                  i,
                  Container(
                    key: keysList[i],
                    child: widget,
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}

List<GlobalKey> keysList = [
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
];

List<Widget> containerWidget = [
  const FirstSection(),
  const SecondSection(),
  const ThirdSection(),
];

// Children version anterior a la list
  // children: [
  //           /*	------------------------------------- */
  //           //?Primera Seccion
  //           FirstSection(pixels: pixelsSCroll),
  //           /*	------------------------------------- */
  //           //?Segunda Seccion.
  //           SecondSection(pixels: pixelsSCroll),
  //           /*	------------------------------------- */
  //           //?Tercera Seccion.
  //           ThirdSection(pixels: pixelsSCroll),
  //           /*	------------------------------------- */
  //           //?Cuarta Seccion.
  //           const FourthSection(),
  //           /*	------------------------------------- */
  //           //Quinta Seccion.
  //           const FiveSection()
  //         ],