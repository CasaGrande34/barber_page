import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
//file addresses
import '../../../../../../utils/spaces.dart';
import '../../../../../../widgets/components_web/profile_title.dart';
import '../../../../../../widgets/slider_custom.dart';

class ThreeSection extends StatefulWidget {
  
  const ThreeSection({Key? key}) : super(key: key);

  @override
  State<ThreeSection> createState() => _ThreeSectionState();
}

class _ThreeSectionState extends State<ThreeSection> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; 
    return Container(
            height: 550,
            width: w,
            color: Colors.white,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -250.0,
                  child: Container(
                    height: 450.0,
                    width: 700.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 36, 36, 36),
                      borderRadius: BorderRadius.circular( 400.0 ),
                    ),
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset('assets/decoration/fondo_barber.jpg',
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 100.0,
                  child: Container(
                    height: 400.0,
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular( 20.0 ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const SliderCustom(),
                  ),
                ),
                const ProfileTitle(
                  top: 15.0, 
                  left: 30.0, 
                  factor: 1.0, 
                  title: 'Send a final design to the team', 
                  subtitle: 'Sara, Client'
                ),
                const ProfileTitle(
                  top: 400.0, 
                  left: 620.0, 
                  factor: 1.0, 
                  title: 'Publish your project whenever you want', 
                  subtitle: 'Micheal'
                ),
                Positioned(
                  right: 270.0,
                  top: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Easy Project Management',
                        style: GoogleFonts.rye(
                          fontWeight: FontWeight.w800,
                          fontSize: 25.0
                        ),  
                      ),
                      addVerticalSpace(15),
                      SizedBox(
                        width: 280.0,
                        child: Text(
                          'In veniam dolor labore elit aliquip mollit eiusmod incididunt reprehenderit.',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      addVerticalSpace(15),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular( 100.0 )
                          ),
                          backgroundColor: Colors.grey[900],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 20.0,
                          ),
                        ),
                        onPressed: () {}, 
                        child: Text(
                          'Try for free',
                          style: GoogleFonts.nunito(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: -5.0,
                  child: Image.asset('assets/props/maquina_barber.png',
                    height: 400.0,
                    fit: BoxFit.contain,                  
                  )
                )
              ],
            ),
          );
  }
}