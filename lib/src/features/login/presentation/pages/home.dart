import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/presentation/pages/home/home.dart';
import 'package:hdev/src/features/login/presentation/pages/login.dart';
import 'package:hdev/src/features/login/presentation/widgets/home/welcome_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdev/src/features/login/presentation/widgets/login/logo_section_widget.dart';

class HomeLogin extends StatelessWidget {
  const HomeLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(children: [
                      SizedBox(
                        height: 90,
                      ),
                      LogoLogin(
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      WelcomeText(),
                    ]),
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                offset: const Offset(0, -2))
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: const Color.fromRGBO(0, 173, 233, 1)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                            
                                  side: const BorderSide(
                                      width: 2, color: Colors.white),
                                  backgroundColor:
                                      const Color.fromRGBO(0, 173, 233, 1),
                                  padding: const EdgeInsets.all(15),
                                  elevation: 0),
                              child: Text('Se connecter',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ))
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 2, color: Colors.white),
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(15),
                                elevation: 0,
                              ),
                              child: Text('S\'inscrire',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromRGBO(0, 173, 233, 1))),
                              onPressed: () => {null},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Connexion',
              style: GoogleFonts.montserrat(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                letterSpacing: -2,
                color: const Color.fromRGBO(0, 79, 159, 1),
              ))
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 20),
      child: Text('Connectez vous à votre espace locataire',
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(0, 79, 159, 1),
          )),
    );
  }
}
