import 'package:flutter/material.dart';
import 'package:landing_page/main.dart';
import 'package:landing_page/models/service.dart';

class ItemService extends StatefulWidget {
  final double factor;
  final ServiceBarber service;
  ItemService({super.key, required this.service, required this.factor});

  @override
  State<ItemService> createState() => _ItemServiceState();
}

class _ItemServiceState extends State<ItemService> {
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
