import 'package:flutter/material.dart';

class SliderCustom extends StatefulWidget {
  SliderCustom({Key? key}) : super(key: key);

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
      print('PaginaActual: $pageController.page');
      
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
      
      children: [
         _Slide(image: 'assets/decoration/1.jpg'),
         _Slide(image: 'assets/decoration/2.jpg'),
      ] 
      
     
    );
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
    double w = MediaQuery.of(context).size.width; 
    double h = MediaQuery.of(context).size.height; 
    return Image.asset( 
      image,
      fit: BoxFit.cover,
      // alignment: Alignment.center, 
    );
  }
}

// class _Dots extends StatelessWidget {
//   const _Dots({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width; 
//     double h = MediaQuery.of(context).size.height; 
//     return Positioned(
//       bottom: 0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _Dot(),
//           _Dot(),
//           _Dot(),
//           _Dot(),
//         ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   const _Dot({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 10,
//       height: 10,
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//     );
//   }
// }
