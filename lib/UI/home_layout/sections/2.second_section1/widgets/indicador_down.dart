import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../../theme/theme_changer.dart';
import '../../../../../providers/scroll_provider.dart';

class IndicadorDown extends StatelessWidget {
  const IndicadorDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    final scrollProvider = Provider.of<ScrollHandlerProviderCustom>(context);
    final pixels = scrollProvider.scrollController.position.pixels;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 700),
      opacity: pixels > 10 ? 0.0 : 1.0,
      child: Icon(
        pixels > 10
            ? Icons.keyboard_double_arrow_down_rounded
            : Icons.add_alert,
        size: 40.0,
        color: appTheme.colorScheme.secondary,
      ),
    );
  }
}
