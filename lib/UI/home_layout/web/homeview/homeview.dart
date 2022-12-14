import 'package:flutter/material.dart';
//dependencies

//file addresses
import '../../widgets/components_web/home_view_body/home_view_body.dart';
import 'package:landing_page/UI/home_layout/widgets/header.dart';

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
          HomeViewBody(),
          Header(),
        ],
      ),  
    );
  }
}

