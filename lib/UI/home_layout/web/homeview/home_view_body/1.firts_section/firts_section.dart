import 'dart:math';
import 'package:flutter/material.dart';
import 'package:landing_page/widgets/components_web/image_listview.dart';
//dependencies
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/theme/theme_changer.dart';
//file addresses
import '../../../../../../utils/spaces.dart';
import '../../../../../../widgets/components_web/profile_image.dart';
import '../../../../../../widgets/components_web/profile_title.dart';

class FirstSection extends StatefulWidget {
  final double pixels;
  const FirstSection({
    Key? key,
    required this.pixels,
  }) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  Widget build(BuildContext context) {
    
    ThemeData appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    
    double w = MediaQuery.of(context).size.width; 
    return  Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: 770.0,
                    width: w * 0.45,
                    color: appTheme.colorScheme.background,
                    child: Stack(
                      children: [
                        Transform(
                          transform: Matrix4.rotationZ( pi / 6 )
                          ..translate( -180.0, 170.0 ),
                          child: Container(
                            height: 350.0,
                            width: 700.0,
                            decoration: BoxDecoration(
                              color: appTheme.colorScheme.onBackground,
                              borderRadius: BorderRadius.circular(300.0)
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration( milliseconds: 700 ),
                          curve: Curves.easeOutBack,
                          top: 200.0,
                          left: widget.pixels < 480 ? 100.0 : 0,
                          child: SizedBox(
                            height: 400.0,
                            width: 400.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('La barberia no es un trabajo, es un arte.',
                                  style: GoogleFonts.rye(
                                    fontSize: 38.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text('Ahora podés reservar un cita con tu barbero favorito online. Es muy fácil, rápido y cómodo.',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                addVerticalSpace(20.0),
                                SizedBox(
                                  width: 300.0,
                                  child: Text(
                                    'Afeitados clásicos a navaja con toallas calientes y frias, cortes de estilo europeo, arreglos de barbas y siempre a la vanguardia.',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ),
                                addVerticalSpace(30.0),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.0,
                                      width: 230.0,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter your mail address',
                                          hintStyle: GoogleFonts.nunito(
                                            fontSize: 12.0
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          )
                                        ),
                                      ),
                                    ),
                                    addHorizontalSpace(20.0),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                        )
                                      ),
                                      onPressed: () {}, 
                                      child: SizedBox(
                                        height: 45.0,
                                        width: 100.0,
                                        child: Center(
                                          child: Text('Get Invite',
                                            style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 770.0,
                    color: appTheme.colorScheme.background,
                    width: w * 0.55,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                          
                        Positioned(
                          right: 280,
                          bottom: 270,
                          child: Transform.rotate(
                            angle: 0.35 * pi,
                            child: Container(
                              height: 250,
                              width: 970,
                              child: ImageListView(
                                startIndex: 1,
                                duration: 60, 
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          bottom: 270,
                          child: Transform.rotate(
                            angle: 0.35 * pi,
                            child: Container(
                              height: 250,
                              width: 970,
                              child: ImageListView(
                                startIndex: 2,
                                duration: 60, 
                              ),
                            ),
                          ),
                        ),


                        //  Positioned(
                        //   left: -120,
                        //   child: ImageListView(startIndex: 1, duration: 60)),
                                 
                        //  Positioned(
                        //   left: 190,
                        //   child: ImageListView(startIndex: 2, duration: 50)),
                               
                             
                           
                         
                         Positioned(
                          bottom: 10,
                          left: 35,
                          child: AnimatedOpacity(
                            duration: const Duration( milliseconds: 700),
                            opacity: widget.pixels > 100 ? 0.0 : 1.0,
                            child: Icon(
                              Icons.keyboard_double_arrow_down_rounded,
                              size: 40.0,
                              color:  appTheme.colorScheme.secondary,
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
  }
}