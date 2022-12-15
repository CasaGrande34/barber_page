import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
//file addresses
import '../../../../../../utils/spaces.dart';
import '../../../../../../widgets/components_web/footer.dart';
import '../../../../../../widgets/buttons/textbutton_custom.dart';

class FiveSection extends StatelessWidget {
  
  const FiveSection({super.key});

    @override
    Widget build(BuildContext context) {
      double w = MediaQuery.of(context).size.width; 
      return Container(
        width: w,
        height: 600,
        color: const Color(0xff373e98),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: const Alignment( 0.0, 1.0 ),
              child: SizedBox(
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
                        addHorizontalSpace( 20.0 ),
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
            const Positioned(
              bottom: 0,
              child: Footer()
            ),
            Align(
              alignment: const Alignment( 1.18, 0.0 ),
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.amber[400],
                  borderRadius: BorderRadius.circular( 100.0 ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset( 0.0, 5.0 ),
                    )
                  ]
                ),
              ),
            )
          ],
        ),
      );
  }
}