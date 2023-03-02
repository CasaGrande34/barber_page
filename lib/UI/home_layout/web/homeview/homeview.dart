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
          Header(),
        ],
      ),
    );
  }
}
