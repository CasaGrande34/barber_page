import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/mobile/screens/home_screen.dart';
import 'package:landing_page/UI/home_layout/web/homeview/homeview.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const HomeScreenM();
      } else {
        // return _isLoading ? ViewLoading() : HomeView();
        return const HomeView();
        // return const ViewLoading();
      }
    });
  }
}
