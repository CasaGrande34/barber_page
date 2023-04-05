import 'package:flutter/material.dart';

import 'home_view_body/home_view_body.dart';
import 'home_view_body/0.header/header_layout.dart';

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
          Headerlayout(),
          Positioned(
            top: 76,
            left: 0,
            child: ProgressHeader(),
          )
        ],
      ),
    );
  }
}
