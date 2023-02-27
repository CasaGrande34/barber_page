import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:landing_page/providers/scroll_provider.dart';

import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import '../../widgets/list_widget_home/list_widget_home.dart';

//Global var
double pixelsSCroll = 0.0;

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    //Controller
    final handleScroll = Provider.of<ScrollHandlerProviderCustom>(context);
    return WebSmoothScroll(
      controller: handleScroll.scrollController,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: handleScroll.scrollController,
        child: Column(children: [
          ...containersWidget
              .asMap()
              .map(
                (i, widget) => MapEntry(
                  i,
                  Container(
                    key: keysList[i],
                    child: widget,
                  ),
                ),
              )
              .values
              .toList(),
        ]),
      ),
    );
  }
}
