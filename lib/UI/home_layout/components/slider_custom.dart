import 'package:flutter/material.dart';

class SliderCustom extends StatefulWidget {
  const SliderCustom({Key? key}) : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<SliderCustom> {
  final pageController = PageController();

  List<String> decorationImage = [
    'assets/decoration/0.jpg',
    'assets/decoration/1.jpg',
    'assets/decoration/2.jpg',
    'assets/decoration/3.jpg',
    'assets/decoration/4.jpg',
    'assets/decoration/5.jpg',
    'assets/decoration/6.jpg',
    'assets/decoration/7.jpg',
    'assets/decoration/8.jpg',
    'assets/decoration/9.jpg',
  ];

  @override
  void initState() {
    pageController.addListener(() {
      // print('PaginaActual: $pageController.page');
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: const [
          _Slide(image: 'assets/decoration/3.jpg'),
          _Slide(image: 'assets/decoration/2.jpg'),
        ]);
  }
}

class _Slide extends StatelessWidget {
  final String image;
  const _Slide({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      // alignment: Alignment.center,
    );
  }
}
