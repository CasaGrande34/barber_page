import 'package:flutter/material.dart';

import '../utils/utils.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
        centerTitle: true,
      ),
      body: SplashWidget(
        child: Container(
          height: h,
          width: w,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(SizesApp.padding30),
        ),
      ),
    );
  }
}

class SplashWidget extends StatefulWidget {
  final Widget child;
  const SplashWidget({super.key, required this.child});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  Offset tapPosition = const Offset(0.0, 0.0);
  late AnimationController controller;
  late Animation<double> animationCircle;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    animationCircle = CurveTween(
      curve: const Interval(0.0, 0.5),
    ).animate(controller);
    // print(' ------------ tapPositionInitState  ------------- ');
    // print(tapPosition);
    super.initState();
  }

  _handlerOntap(TapUpDetails details) {
    setState(() {
      tapPosition = details.localPosition;
    });
    // print(details.localPosition);
    controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => CustomPaint(
        foregroundPainter: SplashPaint(
            progress: animationCircle.value,
            radius: 23,
            tapPosition: tapPosition),
        child: InkWell(
          onTapUp: _handlerOntap,
          child: SizedBox(
            height: h,
            width: w,
          ),
        ),
      ),
    );
  }
}

class SplashPaint extends CustomPainter {
  final double progress;
  final double radius;
  final Offset? tapPosition;
  SplashPaint(
      {required this.progress,
      required this.radius,
      required this.tapPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final progresRadius = radius * progress;

    const strokeWidth = 10.0;
    var currentStrokeWidth = strokeWidth * (1 - progress);
    if (progress < 1.0) {
      canvas.drawCircle(
          tapPosition!,
          progresRadius,
          Paint()
            ..color = Colors.black
            ..style = PaintingStyle.stroke
            ..strokeWidth = currentStrokeWidth);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
