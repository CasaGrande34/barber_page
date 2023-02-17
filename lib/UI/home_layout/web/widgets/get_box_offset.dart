// import 'package:flutter/material.dart';

// class GetBoxOffset extends StatefulWidget {
//   final Widget child;
//   final Function(Offset offset) offset;
//   const GetBoxOffset({super.key, required this.child, required this.offset});

//   @override
//   State<GetBoxOffset> createState() => _GetBoxOffsetState();
// }

// class _GetBoxOffsetState extends State<GetBoxOffset> {
//   final GlobalKey widgetKey = GlobalKey();
//   final Offset offset = Offset(0.0, 0.0);

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       final box = widgetKey.currentContext!.findRenderObject() as RenderBox;
//       final offset = box.localToGlobal(Offset.zero);
//       widget.offset(offset);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: widgetKey,
//       child: widget.child,
//     );
//   }
// }
