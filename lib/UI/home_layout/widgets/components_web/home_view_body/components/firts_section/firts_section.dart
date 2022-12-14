import 'dart:math';
import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
//file addresses
import '../../../profile_image.dart';
import '../../../profile_title.dart';
import '../../../../../../../utils/spaces.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; 
    double h = MediaQuery.of(context).size.height; 
    return  Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: 700.0,
                    width: w * 0.45,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Transform(
                          transform: Matrix4.rotationZ( pi / 6 )
                          ..translate( -180.0, 170.0 ),
                          child: Container(
                            height: 350.0,
                            width: 700.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(300.0)
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200.0,
                          left: 100.0,
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
                    color: Colors.white,
                    width: w * 0.55,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                          Positioned(
                          right: 0.0,
                          top: 30.0,
                          child: Transform.rotate(
                            angle: 40,
                            child: Image.asset(
                              'assets/props/tijeras.png',
                              height: 300,
                            ),
                          ),
                        ),
                        const ProfileImage(
                          top: 140.0,
                          left: 70.0,
                          diameter: 220.0,
                          image: 'assets/clients/1.jpg',
                        ),
                        const ProfileImage(
                          top: 170.0,
                          left: 322.0,
                          diameter: 120.0,
                          image: 'assets/clients/2.jpg',
                        ),
                        const ProfileImage(
                          top: 300.0,
                          left: 280.0,
                          diameter: 300.0,
                          image: 'assets/clients/3.jpg',
                        ),
                        const ProfileImage(
                          top: 370.0,
                          left: 70.0,
                          diameter: 190.0,
                          image: 'assets/clients/4.jpg',
                        ),
                        const ProfileTitle(
                          top: 540.0, 
                          left: 100.0, 
                          factor: 1.0, 
                          title: 'Bernardo Avellaneda', 
                          subtitle: 'Increible atencion y cuidado',
                          startsRating: true,
                        ),
                        const ProfileTitle(
                          top: 140.0, 
                          left: -10.0, 
                          factor: 1.3, 
                          title: 'Jacinto El Pollo', 
                          subtitle: 'Muy buena atencion y la estetica del lugar 10 puntos',
                          startsRating: true,
                        ),
                        const ProfileTitle(
                          top: 160.0, 
                          left: 395.0, 
                          factor: 1.1, 
                          title: '', 
                          subtitle: 'Super atentos, sin dudas volveria',
                          startsRating: true,
                        ),
                        const ProfileTitle(
                          top: 270.0, 
                          left: 440.0, 
                          factor: 1.6, 
                          title: 'Marcelo Arallano', 
                          subtitle: 'Los chicos estan al detalle, muy profesionales.',
                          startsRating: true,
                        ),
                        const Positioned(
                          bottom: 10,
                          left: 35,
                          child: Icon(
                            Icons.keyboard_double_arrow_down_rounded,
                            size: 40.0,
                            color: Colors.grey,
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