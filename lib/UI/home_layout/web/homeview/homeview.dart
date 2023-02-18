import 'package:flutter/material.dart';
//dependencies

//file addresses
import '../widgets/header/header.dart';
import 'home_view_body/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          HomeViewBody(),
          /*TENGO QUE VER QUE HAGO CON ESTE HEADER POR QUE IMPLEMENTE UN HEADER EN EL FIRST SECCION Y QUIERO QUE ESTE SE 
          MUESTRE DE MANERA DINAMICA CUANDO ESTOY EN SECCION MAS ABAJO Y QUIERO SUBIR. */
          Header(),
        ],
      ),
    );
  }
}
