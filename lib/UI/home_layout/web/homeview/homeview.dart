import 'package:flutter/material.dart';
//dependencies

//file addresses
import 'home_view_body/home_view_body.dart';
import 'package:landing_page/widgets/components_web/header.dart';

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
        children: [
          const HomeViewBody(),
          Header(),
        ],
      ),  
    );
  }
}

