import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../utils/sizes_app.dart';
import '../7.footer/footer.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/theme/theme_changer.dart';
import '../../../../utils/buttons/textbutton_custom.dart';

class SixSection extends StatelessWidget {
  const SixSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      height: 600,
      color: appTheme.colorScheme.background,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: SizedBox(
              height: 600.0,
              width: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizesApp.addVerticalSpace(80.0),
                  Text(
                    'Get Started today',
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  SizesApp.addVerticalSpace(20.0),
                  Text(
                    'Freelancer - community of People who values their time',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  SizesApp.addVerticalSpace(30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButtonCustom(
                        onPressed: () {},
                        text: 'Get My price',
                      ),
                      SizesApp.addHorizontalSpace(20.0),
                      TextButtonCustom(
                        onPressed: () {},
                        text: 'Try for free',
                        colorButton: Colors.black,
                        colorText: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Positioned(bottom: 0, child: Footer()),
          Align(
            alignment: const Alignment(1.18, 0.0),
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  color: Colors.amber[400],
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 5.0),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
