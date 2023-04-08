import 'package:fluro/fluro.dart';
import 'package:landing_page/UI/home_layout/mobile/screens/profile_screen.dart';
import 'package:landing_page/UI/login_and_register/screens/register_screen.dart';

// import 'package:landing_page/UI/splash_layout/views/splash_view.dart';

import '../UI/404/screen_404.dart';
import '../UI/home_layout/home_layout.dart';
import '../UI/login_and_register/screens/login_screen.dart';

class RouterFluro {
  static FluroRouter router = FluroRouter();

  static const String homeRoute = '/';
  static const String loginRoute = '/auth/login';
  static const String registerRoute = '/auth/register';
  static const String route404 = '/404';

  static void configureRoutes() {
    router.define(
      homeRoute,
      handler: Handler(
        handlerFunc: ((context, parameters) => const ProfileScreen()),
      ),
    );
    router.define(
      loginRoute,
      handler: Handler(
        handlerFunc: ((context, parameters) => const LoginScreen()),
      ),
    );
    router.define(
      registerRoute,
      handler: Handler(
        handlerFunc: ((context, parameters) => const RegisterScreen()),
      ),
    );
    router.define(
      route404,
      handler: Handler(
        handlerFunc: ((context, parameters) => const Screen404()),
      ),
    );
  }
}
