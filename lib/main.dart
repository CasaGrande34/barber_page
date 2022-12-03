import 'package:flutter/material.dart';
import 'package:landing_page/router/router_fluro.dart';
import 'package:landing_page/theme/theme_changer.dart';
import 'package:provider/provider.dart';

void main() {
  
  RouterFluro.configureRoutes();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeCharger())
    ],
    child: const MyApp()));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      onGenerateRoute: RouterFluro.router.generator,
    );
  }
}