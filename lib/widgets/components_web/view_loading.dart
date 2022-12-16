import 'package:flutter/material.dart';

//dependencies

//file addresses


class ViewLoading extends StatelessWidget {
  
  const ViewLoading({super.key});

    @override
    Widget build(BuildContext context) {
      double w = MediaQuery.of(context).size.width; 
      double h = MediaQuery.of(context).size.height; 
      return Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
          width:  w,
          height: h,
          color: Colors.black,
          child: Center(
            child: Stack(
              children: [
                Image.asset('assets/logos/logo_barberia_fnegro.png',
                  height: 300,
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  curve: Curves.elasticIn,
                  duration: const Duration( milliseconds: 1300 ),
                  builder: (context, value, child) => Transform.scale(
                    scale: 1.0 * value,
                    child: Image.asset('assets/logos/logo_barberia_color.png',
                      height: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
   );
  }
}