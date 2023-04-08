import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:landing_page/providers/bottomnavbar_state.dart';

import 'package:provider/provider.dart';
import 'package:landing_page/providers/scroll_provider.dart';

import 'package:landing_page/router/router_fluro.dart';
import 'package:landing_page/theme/theme_changer.dart';

void main() {
  RouterFluro.configureRoutes();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeCharger(2)),
        ChangeNotifierProvider(
          create: (_) => ScrollHandlerProviderCustom(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavbarState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return MaterialApp(
      // scrollBehavior: MyCustomScrollBehavior(),
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      onGenerateRoute: RouterFluro.router.generator,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
