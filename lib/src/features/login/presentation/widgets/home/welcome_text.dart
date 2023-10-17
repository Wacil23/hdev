import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BIENVENUE',
          style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w800, color: const Color.fromRGBO(0, 47, 98, 1)),
        ),
        Text(
          'Accèder à votre espace locataire',
          style:
              GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: const Color.fromRGBO(0, 47, 98, 1)),
        ),
      ],
    );
  }
}
