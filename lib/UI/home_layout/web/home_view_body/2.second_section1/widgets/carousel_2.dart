// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../../../theme/theme_changer.dart';
// import '2.widgets_exports.dart';

// class Carousel2 extends StatelessWidget {
//   const Carousel2({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
//     return Transform.rotate(
//       angle: 0.35 * pi,
//       child: SizedBox(
//         height: 250,
//         width: 900,
//         child: ShaderMask(
//           blendMode: BlendMode.dstOut,
//           shaderCallback: (Rect bounds) {
//             return LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [
//                 appTheme.background,
//                 Colors.transparent,
//                 Colors.transparent,
//                 appTheme.background,
//               ],
//               stops: const [0.1, 0.6, 0.5, 0.8],
//             ).createShader(bounds);
//           },
//           child: const ImageListView(
//             reverse: true,
//             duration: 200,
//           ),
//         ),
//       ),
//     );
//   }
// }
