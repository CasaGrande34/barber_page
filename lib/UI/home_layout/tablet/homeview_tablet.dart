import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/utils.dart';
import '../components/my_appbar_custom.dart';

class HomeViewTablet extends StatelessWidget {
  final ScrollController scrollHandler;
  const HomeViewTablet({super.key, required this.scrollHandler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarCustom(),
      body: _BodyTablet(controller: scrollHandler),
    );
  }
}

class _BodyTablet extends StatefulWidget {
  final ScrollController controller;
  const _BodyTablet({required this.controller});

  @override
  State<_BodyTablet> createState() => _BodyTabletState();
}

class _BodyTabletState extends State<_BodyTablet> {
  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: widget.controller,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: widget.controller,
        child: Column(children: [
          ...ConstantApp.containersWidget
              .asMap()
              .map(
                (i, widget) => MapEntry(
                  i,
                  Container(
                    key: ConstantApp.keysList[i],
                    child: widget,
                  ),
                ),
              )
              .values
              .toList(),
        ]),
      ),
    );
  }
}
