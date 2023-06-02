import 'package:flutter/material.dart';

import '../router/router_fluro.dart';
import '../services/local_storage.dart';
import '../services/navigation_services.dart';

enum AuthStatus { checking, authenticated, noAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus status = AuthStatus.checking;
  AuthProvider() {
    isAutenticated();
  }

  // -----------------------------------------------
  login(String email, String password) {
    _token = 'akgdskgoadswe43523t.2343252tesgsgs.124fdsgvs';
    // print('Almacenar JWT: $_token');
    LocalStorage.prefs.setString('token', _token!);

    status = AuthStatus.authenticated;

    NavigationService.navigateReplace(RouterFluro.homeRoute);
    notifyListeners();
  }

// ------------------------------------------------
  Future<bool> isAutenticated() async {
    final storage = LocalStorage.prefs.getString('token');
    if (storage == null) {
      status = AuthStatus.noAuthenticated;
      return false;
    }

    //Ir al backend y comprobar que este JWT sea valido
    Future.delayed(const Duration(milliseconds: 2000));
    status = AuthStatus.authenticated;
    return true;
  }
}
