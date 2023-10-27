import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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