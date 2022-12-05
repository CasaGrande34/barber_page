import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/utils/spaces.dart';

class InfoPalette extends StatelessWidget {
  final String title;
  final String text; 
  final IconData icon;
  
  const InfoPalette({
    Key? key,
    required this.title,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Icon(
            icon,
            size: 22.0,
            color: Colors.white,
          ),
        ),
        addVerticalSpace(10.0),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w800,
            fontSize: 18.0,
          ),
        ),
        addVerticalSpace(15.0),
        SizedBox(
          width: 200.0,
          child: Text(
            text,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
              fontSize: 14.0
            ),
          ),
        ),
        addVerticalSpace(15.0),
        Text(
          'Leer mas..',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w800,
            fontSize: 14.0,
          ),
        ),
        Container(
          height: 1.5,
          width: 90.0,
          color: Colors.black87,
        )
      ],
    );
  }
}
