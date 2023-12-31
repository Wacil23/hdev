import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/config/routes/app_router.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/src/features/home/data/repositories/get_contracts_repository_impl.dart';
import 'package:hdev/src/features/home/domain/usecases/get_contracts_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_bloc.dart';
import 'package:hdev/src/features/login/data/repository/authentication_repository.dart';
import 'package:hdev/src/features/login/domain/usecases/login_usecase.dart';
import 'package:hdev/src/features/login/presentation/bloc/authentification/authentication_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await AuthBox.initialize();
  final String? authToken = AuthBox.getToken();
  AuthBox.removeToken();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp(authToken: authToken));
}


class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  final String? authToken;
  MyApp({Key? key, required this.authToken})
      : _appRouter = AppRouter(authToken),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) =>
              AuthenticationBloc(LoginUseCase(AuthenticationRepositoryImpl())),
        ),
        BlocProvider<HomeContractBloc>(
          create: (_) => HomeContractBloc(GetContractsUseCase(
              GetContractsRepositoryImpl(
                  currentBailleurId: currentBailleurId))),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(dividerColor: const Color.fromARGB(0, 255, 255, 255)),
        onGenerateRoute: _appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
