import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/spaces.dart';
import '../../../../buttons/button_blue.dart';
import '../../../../buttons/textbutton_custom.dart';

//dependencies

//file addresses


class FiveSection extends StatelessWidget {
  
  const FiveSection({super.key});

    @override
    Widget build(BuildContext context) {
      double w = MediaQuery.of(context).size.width; 
      double h = MediaQuery.of(context).size.height; 
      return Container(
        width: w,
        height: 600,
        color: const Color(0xff373e98),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment( 0.0, 1.0 ),
              child: Container(
                height: 600.0,
                width: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    addVerticalSpace( 80.0 ),
                    Text(
                      'Get Started today',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                        fontSize: 35.0,
                        color: Colors.white,
                        
                      ),
                    ),
                    addVerticalSpace( 20.0 ),
                    Text(
                      'Freelancer - community of People who values their time',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                    addVerticalSpace( 30.0 ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButtonCustom(
                          onPressed: () {},
                          text: 'Get My price',
                          
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}