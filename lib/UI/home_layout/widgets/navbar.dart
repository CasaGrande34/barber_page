import 'package:flutter/material.dart';

//dependencies

//file addresses
import 'package:landing_page/utils/spaces.dart';
import 'package:landing_page/UI/home_layout/widgets/theme_charger_switch.dart';

class Header extends StatelessWidget {
  
  Header({Key? key}) : super(key: key);

  final List<String> navItems = [
    'Home',
    'Contact',
    'Products',
    'Features'
  ];

  List<Widget> navItem() {
    
     return navItems.map((item) => Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(item, 
          style: const TextStyle(
            fontSize: 15
          ),
        ),
      ),
    ).toList();
  }
  
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset('assets/logos/logo_barberia.png',scale: 1.2),
            ),
            addHorizontalSpace(5),
            if( w >= 789 )
            const Text('Tu oportunidad es ahora'),
            const Spacer(),
             ...navItem(), 
            addHorizontalSpace(30),
            if( w >= 636 )
            const ThemeChangerButton(),
          addHorizontalSpace(13),
          
        ],
      ),
    );
  }
}

