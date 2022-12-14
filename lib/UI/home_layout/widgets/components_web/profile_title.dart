import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:landing_page/utils/spaces.dart';

class ProfileTitle extends StatelessWidget {
  final double top;
  final double left;
  final double factor;
  final String? title;
  final String subtitle;
  final bool startsRating;
  
  const ProfileTitle({
    Key? key,
    required this.top,
    required this.left,
    required this.factor,
    required this.title,
    required this.subtitle,
    this.startsRating = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration( milliseconds: 500 ),
      top: top,
      left: left,
      child: Container(
        padding: EdgeInsets.all( 8.0 * factor),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 5.0 * factor),
              blurRadius: 5.0 * factor,
            ),
          ]
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12.0 * factor,
              backgroundColor: Colors.grey[800],
              child: Icon(
                Icons.mail_outline_rounded,
                size: 12.0 * factor ,
                color: Colors.white,
              ),
            ),
            addHorizontalSpace(5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(
                    title!,
                    style: GoogleFonts.nunito(
                      fontSize: 9.0 * factor,
                      color: Colors.black,
                      
                    ),
                  ),
                  Text(
                  subtitle,
                  style: GoogleFonts.nunito(
                    fontSize: 8.0 * factor,
                    color: Colors.black87,
                    
                  )
                ),
                (startsRating) ? 
                Row(
                  children: const [
                    Icon(Icons.star, size: 12.0, color: Colors.yellow,),
                    Icon(Icons.star, size: 12.0, color: Colors.yellow,),
                    Icon(Icons.star, size: 12.0, color: Colors.yellow,),
                    Icon(Icons.star, size: 12.0, color: Colors.yellow,),
                    Icon(Icons.star, size: 12.0, color: Colors.yellow,),
                  ],
                ) : const SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
