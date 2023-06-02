import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/theme/theme_changer.dart';

import '../../../utils/sizes_app.dart';

class ProfileTitle extends StatelessWidget {
  final double top;
  final double left;
  final double factor;
  final String subtitle;
  final bool startsRating;
  final double pixels;

  const ProfileTitle({
    Key? key,
    required this.top,
    required this.left,
    required this.factor,
    required this.subtitle,
    this.startsRating = false,
    this.pixels = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      top: top,
      left: left,
      child: Container(
        padding: EdgeInsets.all(8.0 * factor),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: appTheme.colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0 * factor),
                blurRadius: 5.0 * factor,
              ),
            ]),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12.0 * factor,
              backgroundColor: Colors.grey[800],
              child: Icon(
                Icons.favorite,
                size: 12.0 * factor,
                color: appTheme.colorScheme.onPrimary,
              ),
            ),
            SizesApp.addHorizontalSpace(5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subtitle,
                  style: GoogleFonts.nunito(
                    fontSize: 9.0 * factor,
                    color: Colors.black87,
                  ),
                ),
                (startsRating)
                    ? Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: appTheme.colorScheme.onPrimary,
                          ),
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: appTheme.colorScheme.onPrimary,
                          ),
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: appTheme.colorScheme.onPrimary,
                          ),
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: appTheme.colorScheme.onPrimary,
                          ),
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: appTheme.colorScheme.onPrimary,
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
