import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/home/presentation/pages/home/home.dart';

import '../../../bloc/authentification/authentication_bloc.dart';
import '../../../bloc/authentification/authentication_event.dart';
import '../../../bloc/authentification/authentication_state.dart';
import '../../../bloc/toggle_password/toogle_password_bloc.dart';

class FormLogin extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const FormLogin({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? emailValid;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildEmailTextField(emailValid, context),
          const SizedBox(height: 10,),
          BlocProvider(
            create: (context) => TooglePasswordBloc(),
            child: BlocBuilder<TooglePasswordBloc, TooglePasswordState>(
              builder: (context, state) {
                return _buildPasswordTextField(state, context);
              },
            ),
          ),
          const SizedBox(height: 50,),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  TextFormField _buildEmailTextField(bool? emailValid, BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: UnderlineInputBorder()
      ),
    );
  }

  TextField _buildPasswordTextField(
      TooglePasswordState state, BuildContext context) {
    return TextField(
      controller: passwordController,
      obscureText: (state as TooglePasswordInitialState).passwordChecked,
      decoration: _buildPasswordInputDecoration(state, context),
    );
  }

  InputDecoration _buildPasswordInputDecoration(
      TooglePasswordState state, BuildContext context) {
    return InputDecoration(
      labelText: 'Mot de passe',
      border: const UnderlineInputBorder(),
      suffixIcon: IconButton(
        icon: Icon((state as TooglePasswordInitialState).passwordChecked
            ? Icons.visibility
            : Icons.visibility_off),
        onPressed: () =>
            context.read<TooglePasswordBloc>().add(ToggleSubmitEvent()),
      ),
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:  const Color.fromRGBO(0, 173, 233, 1),
        padding: const EdgeInsets.only(top: 16, bottom: 16),
      ),
      onPressed: () {
        context.read<AuthenticationBloc>().add(AuthenticationSubmitEvent(
            emailController.text, passwordController.text));
      },
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticatedState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Home()));
          }
        },
        builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2.0,
              
            );
          } else {
            return const Text('Se connecter', style: TextStyle(fontSize: 20));
          }
        },
      ),
    );
  }
}
