import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/presentation/pages/home/home.dart';
import 'package:hdev/src/features/login/presentation/pages/login/login.dart';

class AppRouter {
  final String? authToken;
  AppRouter(this.authToken);
  Route? onGenerateRoute(RouteSettings routeSettings) {
          print({'heelo', authToken});
    switch (routeSettings.name) {
      case '/':
        if (authToken == null) {
          return MaterialPageRoute(builder: (_) => const Login());
        } else {
          return MaterialPageRoute(builder: (_) => const Home());
        }
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      default:
        return null;
    }
  }

}
