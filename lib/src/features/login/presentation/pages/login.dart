import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/login/presentation/widgets/login/form/form_login_widget.dart';
import 'package:hdev/src/features/login/presentation/widgets/login/logo_section_widget.dart';
import '../bloc/authentification/authentication_bloc.dart';
import '../bloc/authentification/authentication_state.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
        body: _buildBody(context, emailController, passwordController));
  }

  Widget _buildBody(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        dynamic errorMessage = "";
        if (state is AuthenticationUnauthenticatedState) {
          errorMessage = state.responseModel?.errors;
        }
        if (state is AuthenticationErrorState) {
          errorMessage = 'Veuillez compléter vos identifiants';
        }
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const LogoSection(),
                const TitleSection(),
                const SizedBox(
                  height: 90,
                ),
                FormLogin(
                    emailController: emailController,
                    passwordController: passwordController),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    errorMessage,
                    style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
              
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Heureux de vous revoir !',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: -.5,
                color: const Color.fromRGBO(0, 47, 98, 1),
              )),
          Text('Connectez vous à votre espace locataire',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(0, 47, 98, 1),
              )),
        ],
      ),
    );
  }
}
