import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/sizes_app.dart';

class NavBarItem extends StatefulWidget {
  final String text;
  final Function touched;
  final bool active;
  const NavBarItem({
    Key? key,
    required this.text,
    required this.touched,
    required this.active,
  }) : super(key: key);

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.touched();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            widget.text,
            style: GoogleFonts.rye(
                color: widget.active ? Colors.black : Colors.black26),
          ),
          const Spacer(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 475),
            height: 5.0,
            width: 35.0,
            decoration: BoxDecoration(
                color: widget.active ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(SizesApp.padding15)),
          ),
        ],
      ),
    );
  }
}
