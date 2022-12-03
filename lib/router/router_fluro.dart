import 'package:fluro/fluro.dart';
import 'package:landing_page/UI/home_layout/web/homeview/homeview.dart';

class RouterFluro {
  
  static FluroRouter router = FluroRouter();
  
  static void configureRoutes() {
    
    router.define(
      '/',
      handler: Handler(handlerFunc: (( context, parameters ) => const HomeView() ))
    );
    
  }
  
  
}