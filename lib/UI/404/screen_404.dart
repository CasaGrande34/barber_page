import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class Screen404 extends StatelessWidget {
  const Screen404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen404'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Screen404',
          style: FontsApp.oldStandardTt,
        ),
      ),
    );
  }
}
