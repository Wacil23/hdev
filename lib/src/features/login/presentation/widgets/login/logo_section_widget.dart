import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/login/presentation/bloc/authentification/authentication_bloc.dart';
import 'package:hdev/src/features/login/presentation/bloc/authentification/authentication_state.dart';

class LogoSection extends StatelessWidget {
    const LogoSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return const LogoLogin(width: 180, height: 180);
      },
    );
  }
}

class LogoLogin extends StatelessWidget {
  final double width;
  final double height;
  const LogoLogin(
      {Key? key,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "text",
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration:  BoxDecoration(
                  shape: BoxShape.circle, color: Color.fromARGB(27, 43, 174, 255).withOpacity(0.1)),
            ),
            Center(
              child: Container(
                width: width - 40,
                height: width - 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(2, 4),
                      )
                    ]),
                child: Image.asset('images/Logo-COTTAGE.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
