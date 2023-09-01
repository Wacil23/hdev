import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/files/data/repositories/login_file_impl.dart';
import 'package:hdev/src/features/files/domain/usecases/login_file_usecase.dart';
import 'package:hdev/src/features/files/presentation/bloc/authentication_file/bloc/authentication_file_bloc.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/header/header_section.dart';

class MesInformations extends StatelessWidget {
  const MesInformations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationFileBloc>(
      create: (context) =>
          AuthenticationFileBloc(LoginFileUseCase(LoginFileImpl())),
      child: BlocBuilder<AuthenticationFileBloc, AuthenticationFileState>(
        builder: (context, state) {
          TextEditingController _passwordController = TextEditingController();
          TextEditingController _emailController = TextEditingController();
          dynamic errorMessage = "";
          if (state is AuthenticationFileSuccess) {
            return ListView(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const HeaderSection(
                        title: 'Mes informations', dividerColor: Colors.amber),
                    ElevatedButton(
                      child: const Text("Importez un fichier"),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ]);
          }
          if (state is AuthenticationFileError) {
            errorMessage = state.responseModel!.errorMessage;
          }
          if (state is AuthenticationFileLoading){
            return CupertinoActivityIndicator();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Saisissez votre email',
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Saisissez votre mot de passe',
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password_rounded),
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Se connecter'),
                  onPressed: () {
                    context.read<AuthenticationFileBloc>().add(
                        AuthenticationSubmitEvent(
                            _emailController.text, _passwordController.text));
                  },
                ),
                Text(errorMessage)
              ],
            ),
          );
        },
      ),
    );
  }
}
