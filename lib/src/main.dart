import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/config/routes/app_router.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/login/data/repository/authentication_repository.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/authentification/authentication_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await AuthBox.initialize();
  final String? authToken = AuthBox.getToken();
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
    return MaterialApp(
          onGenerateRoute: _appRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
  }
}
