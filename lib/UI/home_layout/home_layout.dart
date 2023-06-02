import 'package:flutter/material.dart';
import 'package:landing_page/UI/home_layout/web/views/homeview.dart';
import 'package:landing_page/providers/scroll_provider.dart';
import 'package:landing_page/utils/utils.dart';
import 'package:provider/provider.dart';

import 'mobile/para_acomodar/home_screen.dart';
import 'tablet/homeview_tablet.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollHandler = Provider.of<ScrollHandlerProviderCustom>(context).scrollController;
    return Responsive(
      mobile: HomeScreen(scrollHandler: scrollHandler),
      tablet: HomeViewTablet(scrollHandler: scrollHandler),
      desktop: HomeView(scrollHandler: scrollHandler),
    );
  }
}
