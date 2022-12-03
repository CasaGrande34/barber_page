import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/web/widgets/navbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Column(
        children: [
          NavBar()
        ],
      ),
  
    );
  }
}