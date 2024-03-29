import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/utils.dart';
import '../../components/my_appbar_custom.dart';

class HomeView extends StatelessWidget {
  final ScrollController scrollHandler;
  const HomeView({super.key, required this.scrollHandler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarCustom(),
      body: _HomeViewBody( controller: scrollHandler ),
    );
  }
}

class _HomeViewBody extends StatefulWidget {
  final ScrollController controller;
  const _HomeViewBody({required this.controller});

  @override
  State<_HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<_HomeViewBody> {
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
