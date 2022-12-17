import 'package:flutter/material.dart';
//dependencies
import 'package:provider/provider.dart';
//file addresses
import 'package:landing_page/router/router_fluro.dart';
import 'package:landing_page/theme/theme_changer.dart';

void main() {
  
  RouterFluro.configureRoutes();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeCharger(2)),
      // ChangeNotifierProvider(create: (_) => ScrollHandler()),
    ],
    child: const MyApp()));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeCharger>( context ).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      onGenerateRoute: RouterFluro.router.generator,
    );
  }
}