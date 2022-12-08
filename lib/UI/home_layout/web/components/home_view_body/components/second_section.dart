import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
//file addresses
import '../../info_palette.dart';
import '../../../../../../utils/spaces.dart';

class SecondSection extends StatefulWidget {
  SecondSection({Key? key}) : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  @override
  Widget build(BuildContext context) {
    return     Container(
            height: 450.0,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                // Positioned(
                //   right: -200.0,
                //   child: Container(
                //     height: 330.0,
                //     width: 430.0,
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       borderRadius: BorderRadius.circular(300.0),
                //     ),
                //   ),
                  
                // ),
                Positioned(
                  right: 0,
                  child: Opacity(
                    opacity: 0.25,
                    child: Image.asset('assets/logos/logo_barberia.png',
                      fit: BoxFit.contain,                  
                      height: 340,
                      
                    ),
                  )
                ),
                Column(
                  children: [
                    Text(
                      'Nuestros servicios',
                      style: GoogleFonts.rye(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    addVerticalSpace(40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        InfoPalette(
                          title: 'Cortes de pelo',
                          text: 'Clásicos o modernos. Marcamos tendencia combinando máquinas y tijeras.',
                          icon: Icons.people_rounded,
                        ),
                        InfoPalette(
                          title: 'Barbas',
                          text: 'Afeitada tradicional o recorte de barba. Contamos con el servicio de toalla caliente + asesoramiento.',
                          icon: Icons.pie_chart_rounded,
                        ),
                        InfoPalette(
                          title: 'Niños',
                          text: 'Hemos trabajado para que nuestros clientes mas jovenes cuenten con un lugar donde se sientan comodos.',
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}