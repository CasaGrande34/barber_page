import 'package:flutter/material.dart';

//dependencies

//file addresses


class HomeScreenM extends StatelessWidget {
  
  const HomeScreenM({super.key});

    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: Text(
            
            'HomeScreen', 
            
            style: TextStyle(
                                  
              fontSize: 20,
          ),
        ),
     ),
   );
  }
}