import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/sizes_app.dart';
import '../../../providers/scroll_provider.dart';

class InfoPalette extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final String image;

  const InfoPalette({
    Key? key,
    required this.title,
    required this.text,
    required this.icon,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleContainerInfoPalette(image: image),
        SizesApp.addVerticalSpace(10.0),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w800,
            fontSize: 18.0,
          ),
        ),
        SizesApp.addVerticalSpace(15.0),
        SizedBox(
          width: 200.0,
          child: Text(
            text,
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 14.0),
          ),
        ),
        SizesApp.addVerticalSpace(15.0),
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

class CircleContainerInfoPalette extends StatelessWidget {
  final String image;
  const CircleContainerInfoPalette({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final pixels = Provider.of<ScrollHandlerProviderCustom>(context)
        .scrollController
        .position
        .pixels;

    return AnimatedContainer(
      clipBehavior: Clip.antiAlias,
      curve: Curves.elasticInOut,
      duration: const Duration(milliseconds: 1000),
      height: pixels >= 1506 && pixels <= 2000 ? 170 : 120,
      width: pixels >= 1506 && pixels <= 2000 ? 170 : 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.red),
      ),
      child: Image.asset(image, fit: BoxFit.cover, isAntiAlias: false),
    );
  }
}
