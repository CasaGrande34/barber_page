import 'package:flutter/material.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';

class TextButtonCustom extends StatelessWidget {
  
  final String text;
  final Function()? onPressed;
  final double height;
  final Color colorButton;
  final Color colorText;
  
  const TextButtonCustom({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 55.0,
    this.colorText = const Color(0xff373e98),
    this.colorButton = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 40.0 ),
        ),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all( 0.0 ),
      ),
      onPressed: onPressed, 
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0, 
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 40.0 ),
          border: Border.all(
            color: colorButton,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.josefinSans(
            color: colorButton,
            fontSize: 12.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

  }
}
