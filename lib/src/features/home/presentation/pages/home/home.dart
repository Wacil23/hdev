import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Effectuer un paiement',
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          icon: const Icon(Icons.credit_card_rounded),
          backgroundColor: const Color.fromARGB(255, 4, 85, 171)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

