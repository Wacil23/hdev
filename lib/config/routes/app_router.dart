import 'package:flutter/material.dart';
import 'package:hdev/src/features/login/data/jwt/decode_token.dart';
import 'package:hdev/src/features/home/presentation/pages/home/home.dart';
import 'package:hdev/src/features/login/presentation/pages/login/login.dart';

class AppRouter {
  final String? authToken;
  AppRouter(this.authToken);
  Route? onGenerateRoute(RouteSettings routeSettings) {
          print('heelo');
    switch (routeSettings.name) {
      case '/':
        if (authToken == null || isTokenExpired(authToken!)) {
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

  bool isTokenExpired(String token) {
    
    final decodedToken = parseJwtPayLoad(token);
    return DateTime.now().isAfter(decodedToken.expirationDate);
  }
}
