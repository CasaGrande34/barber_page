import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:landing_page/utils/spaces.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 300.0,
      width: w,
      color: appTheme.colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!Resources
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Resources',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Home',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Find a Team',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Publish a project',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'About',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),

//!About
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'About',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'General info',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Tariffs',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'FAQs',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Contacts',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
              // //!Free tools
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Free Tools',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Community',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Project Management',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Statistics',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
              // //!Legal
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Legal',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Privacy Policy',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Terms of use',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Payments',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          addVerticalSpace(40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.copyright_rounded,
                color: Colors.black54,
                size: 15.0,
              ),
              Text(
                '2022 All rights reserved',
                style: GoogleFonts.nunito(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
