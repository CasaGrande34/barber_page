import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import 'mobile/home_screen.dart';
import 'package:landing_page/UI/home_layout/web/homeview.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // late bool _isLoading;

  // @override
  // void initState() {
  //   _isLoading = true;
  //   Future.delayed(const Duration(milliseconds: 2000), () {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: HomeView(),
      mobile: HomeScreen(),
    );
  }
}
