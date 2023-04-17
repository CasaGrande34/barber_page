import 'package:flutter/material.dart';
import 'package:landing_page/main.dart';
import 'package:landing_page/models/service.dart';

class IconService extends StatefulWidget {
  final double factor;
  final ServiceBarber service;
  const IconService({super.key, required this.service, required this.factor});

  @override
  State<IconService> createState() => _IconServiceState();
}

class _IconServiceState extends State<IconService> {
  String asset = 'assets/icons/tijera_blanca.png';

  final List<String> assets = [
    'assets/icons/tijera_blanca.png',
    'assets/icons/barba_blanca.png',
    'assets/icons/navaja_blanca.png',
    'assets/icons/brocha_blanca.png'
  ];

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black38,
      radius: context.w * widget.factor + 0.5,
      child: Image.asset(
        widget.service.asset,
        height: context.w * widget.factor,
      ),
    );
  }
}
