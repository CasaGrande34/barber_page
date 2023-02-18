import 'package:flutter/material.dart';
import 'package:landing_page/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
//dependencies
//🔥🔥🔥PROBAMOS PAQUETE WEB
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
//file addresses
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/1.first_section/first_section.dart';
// import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/5.five_section/five_section.dart';
// import '4.fourth_section/fourth_section.dart';
import '2.second_section/second_section.dart';
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/3.third_section/third_section.dart';

import '4.fourth_section/fourth_section.dart';

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
  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    //Controller
    final handleScroll = Provider.of<ScrollHandlerProvider>(context);
    return WebSmoothScroll(
      controller: handleScroll.scrollController,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: handleScroll.scrollController,
        child: Column(children: [
          ...containersWidget
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
        ]),
      ),
    );
  }
}

List<Widget> containersWidget = [
  const FirstSection(),
  const SecondSection(),
  const ThirdSection(),
  const FourthSection(),
];
