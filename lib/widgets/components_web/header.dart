import 'package:flutter/material.dart';

//dependencies
import 'package:google_fonts/google_fonts.dart';

//file addresses
import 'package:landing_page/utils/spaces.dart';
import 'package:landing_page/widgets/theme_charger_switch.dart';

import '../navbar_item.dart';

class Header extends StatefulWidget {
  
  Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final List<bool> selected = [
    true, false, false, false,
  ];

  void select(int n) {
    for (int i = 0; i < 4; i++) {
      if(i!=n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
      
    }
  }
  // List<Widget> navItem() {
  @override
  Widget build(BuildContext context) {
    
    double w = MediaQuery.of(context).size.width; 
    double h = MediaQuery.of(context).size.height; 
    return Container(
      color: Colors.grey,
      height: h * .1,
      width: w,
      child: Row(
        children: [
          
            addHorizontalSpace(30),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: FadeInImage(
                placeholderFilterQuality: FilterQuality.low,
                image: AssetImage('assets/logos/logo_barberia_color.png'),
                placeholder: AssetImage('assets/props/loading.gif'),
                ),
            ),
            addHorizontalSpace(5),
            if( w >= 789 )
            Text(
              'Shelby - BarberShop',
              style: GoogleFonts.rye(
                fontSize: 15
              ),
            ),
            const Spacer(),
            NavBarItem(
              text: 'Home',
              active: selected[0],
              touched: () {
                setState(() {
                  select(0); 
                });
              },
            ),
            addHorizontalSpace( 50.0 ),
            NavBarItem(
              text: 'Services',
              active: selected[1],
              touched: () {
                setState(() {
                  select(1); 
                });
              },
            ),
            addHorizontalSpace( 50.0 ),
            NavBarItem(
              text: 'Products',
              active: selected[2],
              touched: () {
                setState(() {
                  select(2); 
                });
              },
            ),
            addHorizontalSpace( 50.0 ),
            NavBarItem(
              text: 'Settings',
              active: selected[3],
              touched: () {
                setState(() {
                  select(3); 
                });
              },
            ),
            addHorizontalSpace(30),
            if( w >= 636 )
            const ThemeChangerButton(),
          addHorizontalSpace(13),
          
        ],
      ),
    );
  }
}

