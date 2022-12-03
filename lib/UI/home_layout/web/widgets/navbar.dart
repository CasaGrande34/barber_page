import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landing_page/utils/spaces.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme_changer.dart';


class NavBar extends StatelessWidget {
  
  NavBar({Key? key}) : super(key: key);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
            addHorizontalSpace(30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset('assets/logos/logo_libra_negro.png',scale: 1.2),
            ),
            addHorizontalSpace(5),
            const Text('Tu oportunidad es ahora'),
            const Spacer(),
             ...navItem(), 
            addHorizontalSpace(30),
            SizedBox(
              width: w * .076,
              child: const ThemeChangerButton()),
          addHorizontalSpace(10),
        ],
      ),
    );
  }
}

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    //Theme
    final themeChangerButton = Provider.of<ThemeCharger>(context);

    return Row(
      children: [
        
        Switch.adaptive(
            value: themeChangerButton.isDark, 
            onChanged: ((value) => themeChangerButton.isDark = value),
        ),  
        addHorizontalSpace(8),
        (themeChangerButton.isDark == true)?
        const Icon(FontAwesomeIcons.moon)
        : const Icon(FontAwesomeIcons.sun),
       ]
    );
  }
}