import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/scroll_provider.dart';
import '../../../../../utils/utils.dart';
import 'widgets/2.widgets_exports.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            right: pixels <= 670 ? -1000 : 200,
            child: const RowBoxImageItems()),
      ],
    );
  }
}

class RowBoxImageItems extends StatelessWidget {
  const RowBoxImageItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BoxImageItem(),
          BoxImageItem(),
          BoxImageItem(),
        ],
      ),
    );
  }
}

class BoxImageItem extends StatelessWidget {
  const BoxImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizesApp.padding10),
      height: 300,
      width: 200,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '01',
            style: FontsApp.oldStandardTt.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
