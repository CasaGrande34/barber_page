import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

//dependencies

//file addresses

class HomeScreenM extends StatelessWidget {
  const HomeScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shelby Barber',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.amber,
        ));
  }
}
