import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../utils/constant.dart';

import '../../components/my_appbar_custom.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollHandler;
  const HomeScreen({super.key, required this.scrollHandler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarCustom(),
      body: _BodyMobile(controller: scrollHandler),
    );
  }
}

class _BodyMobile extends StatefulWidget {
  final ScrollController controller;
  const _BodyMobile({required this.controller});

  @override
  State<_BodyMobile> createState() => _BodyMobileState();
}

class _BodyMobileState extends State<_BodyMobile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
