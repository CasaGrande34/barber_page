
import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  
  final String text;
  final Function()? onPressed;
  final double height;
  
  
  const ButtonBlue({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 55.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        shape: MaterialStatePropertyAll(StadiumBorder( )),
        elevation: MaterialStatePropertyAll<double>( 2.0 ),
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue ),
      ),
      onPressed: onPressed, 
      child: Container(
        width: double.infinity,
        height: height,
        child: Center(
          child: Text(
            text,
            style: const TextStyle( color: Colors.white, fontSize: 17.0, ),
          ),
        ),
      ),
    );

  }
}
