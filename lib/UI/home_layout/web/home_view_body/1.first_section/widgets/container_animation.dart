import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../../../theme/theme_changer.dart';
import '../../../../../../utils/utils.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({
    super.key,
  });

  @override
  State<ContainerAnimation> createState() =>
      _ContainerAnimationPresentationState();
}

class _ContainerAnimationPresentationState extends State<ContainerAnimation> {
  bool isTapped = false;

  @override
  void initState() {
    cambiodeValordeIsTapped();
    super.initState();
  }

  cambiodeValordeIsTapped() {
    Timer(const Duration(seconds: 10), () {
      setState(() {
        isTapped = true;
      });
    });
    Timer(const Duration(seconds: 20), () {
      setState(() {
        isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Transform.rotate(
      angle: 102.1,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
        constraints: const BoxConstraints(maxHeight: 110, minHeight: 2),
        height: isTapped ? 110 : 2,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Transform.rotate(
            angle: 102.1,
            child: Padding(
              padding: const EdgeInsets.only(top: SizesApp.padding30),
              child: isTapped
                  ? Text(
                      'No olvides reservar tu turno',
                      style: FontsApp.roboto.copyWith(
                          color: appTheme.colorScheme.background, fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  : null,
            )),
      ),
    );
  }
}
