import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TabbedPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(color: Color.fromRGBO(0, 58, 119, 1),borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              'Accueil',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 20),
               decoration: const BoxDecoration(color: Color.fromRGBO(0, 58, 119, 1),borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              'Mon Historique',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 20),
               decoration: const BoxDecoration(color: Color.fromRGBO(0, 58, 119, 1),borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              'Mes documents',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 20),
               decoration: const BoxDecoration(color: Color.fromRGBO(0, 58, 119, 1),borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              'Mes avis d\'échéances',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 20),
               decoration: const BoxDecoration(color: Color.fromRGBO(0, 58, 119, 1),borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              'Hello',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
