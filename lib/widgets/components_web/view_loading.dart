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
            child: Image.asset('assets/logos/logo_barberia.png',
              height: 300,
            ),
          ),
        )
   );
  }
}