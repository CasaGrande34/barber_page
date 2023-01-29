//dependencies
import 'package:fluro/fluro.dart';
//file addresses
import 'package:landing_page/UI/splash_layout/views/first_view.dart';

class RouterFluro {
  static FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: ((context, parameters) => const FirstSplashView()),
      ),
    );
  }
}
