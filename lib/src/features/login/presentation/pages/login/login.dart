import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentification/authentication_bloc.dart';
import '../../bloc/authentification/authentication_state.dart';
import '../../widgets/login/form_login_widget/form_login_widget.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 246, 250, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _buildBody(context, emailController, passwordController),
      ),
    );
  }

  Widget _buildBody(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        dynamic errorMessage = "";

        if (state is AuthenticationUnauthenticatedState) {
          errorMessage = state.responseModel?.errors;
        }
        if(state is AuthenticationErrorState){
          errorMessage = 'Veuillez compléter vos identifiants';
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Authentication',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.amber,
                  thickness: 5,
                  endIndent: 300,
                )),
            const SizedBox(height: 20),
            Text(errorMessage, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            FormLogin(
                emailController: emailController,
                passwordController: passwordController)
          ],
        );
      },
    );
  }
}
