import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../theme/theme_changer.dart';
import '../../../../../../../utils/responsive.dart';

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
    final w = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Container(
        width: w * .07,
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: Transform.rotate(
          angle: 180,
          child: Padding(
            padding: EdgeInsets.all(w * .019),
            child: Image.asset('assets/props/tijeras.png',
                scale: Responsive.isDesktop(context) ? w * .02 : w * .03),
          ),
        ),
      ),
    );
  }
}
