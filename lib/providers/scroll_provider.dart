import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/web/widgets/list_widget_home/list_widget_home.dart';

class ScrollHandlerProviderCustom extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  ScrollHandlerProviderCustom() {
    scrollController.addListener(() {
      scrollController.position.pixels;
      notifyListeners();
    });
  }

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
  }

  void navegateScroll(double offset, int seconds, Curve curve) async {
    await scrollController.animateTo(offset,
        duration: Duration(seconds: seconds), curve: curve);
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    scrollController.dispose();
    super.dispose();
  }
}
