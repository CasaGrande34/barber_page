import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../theme/theme_changer.dart';

class ItemFlotante extends StatefulWidget {
  const ItemFlotante({
    super.key,
  });

  @override
  State<ItemFlotante> createState() => _ItemFlotanteState();
}

class _ItemFlotanteState extends State<ItemFlotante>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..forward()
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Container(
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
        child: Padding(
          padding: EdgeInsets.all(8.0 * animationController.value),
          child: Container(
            width: 45,
            height: 45,
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
              angle: 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/props/tijeras.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
