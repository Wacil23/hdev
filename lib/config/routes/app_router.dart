import 'package:flutter/material.dart';
import 'package:hdev/src/features/contract/presentation/pages/contratct.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/src/features/home/presentation/pages/home/home.dart';
import 'package:hdev/src/features/login/presentation/pages/home.dart';

class AppRouter {
  final String? authToken;
  AppRouter(this.authToken);
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        if (authToken == null) {
          return MaterialPageRoute(builder: (_) => const HomeLogin());
        } else {
          return MaterialPageRoute(builder: (_) => const Home());
        }
      case '/home':
      return MaterialPageRoute(builder: (_) => const Home());
      case '/login':
        return MaterialPageRoute(builder: (_) => const HomeLogin());
      case '/contrat':
        var arg = routeSettings.arguments;
        if (arg is ContractsModel) {
          return MaterialPageRoute(builder: (_) => Contract(contract: arg));
        }
      case '/contrat-simple':
          return MaterialPageRoute(builder: (_) => const Contract());
      
      default:
        return null;
    }
  }
}
