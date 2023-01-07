import 'package:flutter/material.dart';
import 'package:landing_page/widgets/components_web/image_listview.dart';

import '../../utils/spaces.dart';

class PruebaImageListView extends StatelessWidget {
  const PruebaImageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; 
    double h = MediaQuery.of(context).size.height; 
    return Scaffold(
      body: SizedBox(
        height: 300,
        width: double.infinity,
        child: ImageListView(
          startIndex: 1,
          duration: 50,
        ),
      ),
    );
  }
}