import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/config/routes/app_router.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/src/features/login/data/jwt/decode_token.dart';
import 'package:hdev/src/features/login/presentation/bloc/authentification/authentication_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/login/data/repository/authentication_repository.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/authentification/authentication_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await AuthBox.initialize();

  final String? authToken = await AuthBox.getToken();

  final BlocProvider<AuthenticationBloc> blocProvider = BlocProvider(
      create: (context) =>
          AuthenticationBloc(LoginUseCase(AuthenticationRepositoryImpl())),
      child: MyApp(authToken: authToken));

  runApp(blocProvider);
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  final String? authToken;

  MyApp({Key? key, required this.authToken})
      : _appRouter = AppRouter(authToken),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    print({'token salut', authToken});
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticatedState) {
            print({'Coucou', state.token!.tokenValue});
            if (state.token == null || _isTokenExpired(state.token!.tokenValue)) {
            
            }
          }
        },
        child: MaterialApp(
          onGenerateRoute: _appRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        ));
  }

  bool _isTokenExpired(String token) {
    final decodedToken = parseJwtPayLoad(token);
    return DateTime.now().isAfter(decodedToken.expirationDate);
  }
}
