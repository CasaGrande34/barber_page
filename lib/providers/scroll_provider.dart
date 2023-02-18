import 'package:flutter/material.dart';

class ScrollHandlerProvider extends ChangeNotifier {
//-------------------------Controller 🔥
  final ScrollController scrollController = ScrollController();
  double pixels = 0.0;

  double get scroll {
    final double scroll = scrollController.position.pixels;
    pixels = scroll;
    notifyListeners();

    return pixels;
  }

  //🔥 -------------------------------- title>Estoy trabajando aca. date>17/2/23
  void boxScroll(int position, Curve curve, int seconds) {
    final RenderBox renderBox =
        keysList[position].currentContext!.findRenderObject() as RenderBox;
    //Tamanio del height del container con el key.
    final double widgetHeight = renderBox.size.height;
    double totalHeight = 0;
    double currentPosition = scrollController.position.pixels;

    for (int i = 0; i < position; i++) {
      RenderBox box =
          keysList[i].currentContext!.findRenderObject() as RenderBox;
      totalHeight += box.size.height;
    }

    double newPosition = totalHeight - (widgetHeight - widgetHeight) / 2;
    if (newPosition < 0) {
      newPosition = 0;
    }

    if (currentPosition > newPosition) {
      navegateScroll(newPosition, seconds, curve);
    } else {
      double maxPosition = scrollController.position.maxScrollExtent;
      if (newPosition > maxPosition) {
        newPosition = maxPosition;
      }
      navegateScroll(newPosition, seconds, curve);
    }

    notifyListeners();
  }

  void navegateScroll(double offset, int seconds, Curve curve) {
    scrollController.animateTo(offset,
        duration: Duration(seconds: seconds), curve: curve);
  }
}

List<GlobalKey> keysList = [
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
];
