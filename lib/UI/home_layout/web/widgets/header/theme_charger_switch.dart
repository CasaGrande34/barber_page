import 'package:flutter/material.dart';
//dependencies
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//file addresses
import '../../../../../utils/spaces.dart';
import '../../../../../theme/theme_changer.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Theme
    final themeChangerButton = Provider.of<ThemeCharger>(context);
    final appTheme = themeChangerButton.currentTheme;

    return Row(children: [
      Switch.adaptive(
        value: themeChangerButton.isDark,
        onChanged: ((value) => themeChangerButton.isDark = value),
        activeColor: appTheme.colorScheme.primary,
        activeTrackColor: appTheme.colorScheme.onPrimary,
      ),
      addHorizontalSpace(5),
      (themeChangerButton.isDark == true)
          ? Icon(FontAwesomeIcons.moon, color: appTheme.colorScheme.primary)
          : const Icon(FontAwesomeIcons.sun),
    ]);
  }
}
