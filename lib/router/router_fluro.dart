//dependencies
import 'package:fluro/fluro.dart';
//file addresses
import 'package:landing_page/UI/home_layout/home_layout.dart';

class RouterFluro {
  
  static FluroRouter router = FluroRouter();
  
  static void configureRoutes() {
    
    router.define(
      '/',
      handler: Handler(handlerFunc: (( context, parameters ) => const ResponsiveLayout() ))
    );
    
  }
  
  
}