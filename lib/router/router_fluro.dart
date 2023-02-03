//dependencies
import 'package:fluro/fluro.dart';
//file addresses
import 'package:landing_page/UI/splash_layout/views/splash_view.dart';

import '../UI/home_layout/home_layout.dart';

class RouterFluro {
  static FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: ((context, parameters) => const HomeLayout()),
      ),
    );
  }
}
