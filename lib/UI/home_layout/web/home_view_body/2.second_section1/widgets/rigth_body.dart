import 'package:flutter/material.dart';

import '2.widgets_exports.dart';

import 'package:provider/provider.dart';
import '../../../../../../theme/theme_changer.dart';
import '../../../../../../providers/scroll_provider.dart';

class RightBody extends StatelessWidget {
  const RightBody({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;

    return Container(
      height: h,
      color: appTheme.colorScheme.background,
      width: w * 0.55,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: h,
            width: w,
            child: Image.asset('assets/clients/8.jpg', fit: BoxFit.cover),
          ),

          // const Positioned(
          //   top: 30,
          //   right: 20,
          //   child: TijerasItem(),
          // ),
        ],
      ),
    );
  }
}
