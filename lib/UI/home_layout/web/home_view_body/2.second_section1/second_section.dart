import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/scroll_provider.dart';
import 'widgets/2.widgets_exports.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;

    return Stack(
      children: [
        Row(
          children: const [LeftBody(), RightBody()],
        ),
        AnimatedPositioned(
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 1000),
            top: 400,
            right: pixels <= 670 ? -600 : 200,
            child: const BoxImageItem()),
      ],
    );
  }
}

class BoxImageItem extends StatelessWidget {
  const BoxImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 300,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 300,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 300,
            width: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
