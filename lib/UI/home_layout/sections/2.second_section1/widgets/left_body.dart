import 'dart:math';
import 'package:flutter/material.dart';

import '2.widgets_exports.dart';

import 'package:provider/provider.dart';
import '../../../../../providers/scroll_provider.dart';
import '../../../../../theme/theme_changer.dart';

class LeftBody extends StatefulWidget {
  const LeftBody({super.key});

  @override
  State<LeftBody> createState() => _LeftBodyState();
}

class _LeftBodyState extends State<LeftBody> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;

    return Container(
      height: h,
      width: w * 0.45,
      color: appTheme.colorScheme.background,
      child: Stack(
        children: [
          const _ContainerDecoration(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutBack,
            top: 200.0,
            left: pixels <= 670 ? -800 : 100.0,
            child: const ColumnEmailSend(),
          ),
          const Positioned(
            bottom: 10,
            left: 35,
            child: IndicadorDown(),
          )
        ],
      ),
    );
  }
}

class _ContainerDecoration extends StatelessWidget {
  const _ContainerDecoration();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Transform(
      transform: Matrix4.rotationZ(pi / 6)..translate(-180.0, 170.0),
      child: Container(
        height: 350.0,
        width: 700.0,
        decoration: BoxDecoration(
          color: appTheme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(300.0),
        ),
      ),
    );
  }
}
