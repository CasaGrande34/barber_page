import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
//file addresses
import '../../../../../../utils/spaces.dart';
import '../../../../../../widgets/solo_icon.dart';
import '../../../../../../widgets/slider_custom.dart';

class ThreeSection extends StatefulWidget {
  double pixels;
  ThreeSection({
    Key? key,
    required this.pixels,
  }) : super(key: key);

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
                AnimatedPositioned(
                  duration: const Duration( milliseconds: 700 ),
                  curve: Curves.easeOutQuad,
                  top: 20.0,
                  left: widget.pixels >= 410 && widget.pixels < 1600? 100.0 : 20.0,
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
                Positioned(
                  top: 15.0, 
                  left: 75.0, 
                  child: AnimatedScale(
                    curve: Curves.easeInSine,
                    scale: widget.pixels > 420 ? 1.0 : 0.0,
                    duration: const Duration( milliseconds: 700 ),
                    child: SoloIcon(
                      icon: Icons.arrow_circle_left,
                      pixels: widget.pixels, 
                      factor: 1.0,
                    ),                
                  ),
                ),
                Positioned(
                  top: 390.0, 
                  left: 780.0,                   
                  child: AnimatedScale(
                    curve: Curves.easeInSine,
                    scale: widget.pixels > 420 && widget.pixels < 1600 ? 1.0 : 0.0,
                    duration: const Duration( milliseconds: 700 ),
                    child: SoloIcon(
                      icon: Icons.arrow_circle_right,
                      pixels: widget.pixels, 
                      factor: 1.0, 
                    ),          
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration( milliseconds: 700 ),
                  curve: Curves.decelerate,
                  right: widget.pixels >= 415 && widget.pixels < 1500 ? 270.0 : 5.0,
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
              AnimatedPositioned(
                  duration: const Duration( milliseconds: 700 ),
                  top: widget.pixels >= 410 && widget.pixels < 1600 ? 10.0 : -20,
                  right: -5.0,
                  child: AnimatedScale(
                    duration: const Duration( milliseconds: 700 ),
                    scale: widget.pixels > 400 ? 1.0 : 0.0,
                    child: Image.asset('assets/props/maquina_barber.png',
                      height: 400.0,
                      fit: BoxFit.contain,                  
                    ),
                  )
                )
              ],
            ),
          );
  }
}