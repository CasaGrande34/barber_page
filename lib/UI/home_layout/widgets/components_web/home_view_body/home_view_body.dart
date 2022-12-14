import 'package:flutter/material.dart';
//dependencies

//file addresses
import 'package:landing_page/UI/home_layout/widgets/components_web/home_view_body/components/firts_section/firts_section.dart';
import 'package:landing_page/UI/home_layout/widgets/components_web/home_view_body/components/five_section/five_section.dart';
import 'components/four_section/four_section.dart';
import 'components/second_section/second_section.dart';
import 'package:landing_page/UI/home_layout/widgets/components_web/home_view_body/components/three_section/three_section.dart';


class HomeViewBody extends StatelessWidget {

  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
          //? Primera seccion.
          const FirstSection(),
          /*	------------------------------------- */ 
          //?Seccion de los servicios.
          SecondSection(),      
          /*	------------------------------------- */ 
          //?Tercera Seccion.
          const ThreeSection(),
          /*	------------------------------------- */ 
          //?Cuarta Seccion.
          const FourSection(),
          /*	------------------------------------- */ 
          //? Quint seccion.
          const FiveSection()
        ],
      ),
    );
  }
}