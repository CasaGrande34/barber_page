import 'dart:math';
import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/UI/home_layout/web/components/profile_image.dart';
import 'package:landing_page/UI/home_layout/web/components/profile_title.dart';
//file addresses
import 'package:landing_page/utils/spaces.dart';

import 'info_palette.dart';

class HomeViewBody extends StatelessWidget {

  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; 
    double h = MediaQuery.of(context).size.height; 
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
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
                                  style: GoogleFonts.yesevaOne(
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
                    height: 700.0,
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
                          left: 90.0,
                          diameter: 200.0,
                          image: 'assets/profileimages/1.jpg',
                        ),
                        const ProfileImage(
                          top: 160.0,
                          left: 310.0,
                          diameter: 100.0,
                          image: 'assets/profileimages/2.jpg',
                        ),
                        const ProfileImage(
                          top: 275.0,
                          left: 280.0,
                          diameter: 280.0,
                          image: 'assets/profileimages/3.jpg',
                        ),
                        const ProfileImage(
                          top: 360.0,
                          left: 90.0,
                          diameter: 170.0,
                          image: 'assets/profileimages/4.jpg',
                        ),
                        const ProfileTitle(
                          top: 380.0, 
                          left: 50.0, 
                          factor: 0.9, 
                          title: 'Magna duis incididunt.', 
                          subtitle: 'Occaecat anim aute do ipsum id irure officia.'
                        ),
                        const ProfileTitle(
                          top: 140.0, 
                          left: -10.0, 
                          factor: 1.1, 
                          title: 'Ad tempor velit officia aliquip.', 
                          subtitle: 'Quis cillum sunt ipsum occaecat nisi qui et officia.'
                        ),
                        const ProfileTitle(
                          top: 160.0, 
                          left: 380.0, 
                          factor: 0.7, 
                          title: 'Aliquip esse ipsum tempor adipisicing.', 
                          subtitle: 'Irure veniam in consectetur aliqua laboris aute deserunt.'
                        ),
                        const ProfileTitle(
                          top: 270.0, 
                          left: 440.0, 
                          factor: 1.5, 
                          title: 'Ea et laborum irure aute tempor ut mollit ex enim.', 
                          subtitle: 'Nisi nulla reprehenderit velit nulla exercitation adipisicing laboris excepteur eu incididunt dolore ex dolore.'
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 400.0,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  right: -200.0,
                  child: Container(
                    height: 330.0,
                    width: 430.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(300.0),
                    ),
                  ),
                  
                ),
                Column(
                  children: [
                    Text(
                      'Nuestros trabajos',
                      style: GoogleFonts.yesevaOne(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    addVerticalSpace(40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        InfoPalette(
                          title: 'Proident voluptate id minim.',
                          text: 'Occaecat esse pariatur officia ipsum anim occaecat adipisicing.',
                          icon: Icons.people_rounded,
                        ),
                        InfoPalette(
                          title: 'Amet et sit voluptate ut et.',
                          text: 'Ipsum eu ipsum laboris aliqua exercitation quis excepteur.',
                          icon: Icons.pie_chart_rounded,
                        ),
                        InfoPalette(
                          title: 'Elit et officia eu ipsum ea.',
                          text: 'Cillum laboris enim ut enim culpa minim esse.',
                          icon: Icons.person_rounded,
                        ),
                      ],
                    ),
                    addVerticalSpace(60.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.all(0.0)
                      ),
                      onPressed: () {}, 
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, 
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(
                            color: Colors.grey[800]!,
                          )
                        ),
                        child: Text(
                          'Explore more..',
                          style: GoogleFonts.nunito(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                      
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}