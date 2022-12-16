import 'package:flutter/material.dart';
//dependencies

//file addresses
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/1.firts_section/firts_section.dart';
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/5.five_section/five_section.dart';
import '4.four_section/four_section.dart';
import '2.second_section/second_section.dart';
import 'package:landing_page/UI/home_layout/web/homeview/home_view_body/3.three_section/three_section.dart';


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
        print( scrollController.position.pixels );
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
          
          //? Primera Seccion.
           const FirstSection(),
          /*	------------------------------------- */ 
          //?Segunda Seccion
          SecondSection( pixels: pixels ),      
          /*	------------------------------------- */ 
          //?Tercera Seccion.
           const ThreeSection(),
          /*	------------------------------------- */ 
          //?Cuarta Seccion.
           const FourSection(),
          /*	------------------------------------- */ 
          //? Quinta Seccion.
           const FiveSection()
        ],
      ),
    );
  }
}