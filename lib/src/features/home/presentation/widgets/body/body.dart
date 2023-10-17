import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/src/features/home/data/repositories/get_actuality_repository_impl.dart';
import 'package:hdev/src/features/home/domain/usecases/get_actuality_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_bloc.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/actuality/actuality_card_section.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/contract/contract_card_section.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/tab_bar/tab_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 380,
          color: const Color.fromRGBO(0, 78, 159, 1),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/contrat-simple');
                        },
                        child: Hero(
                          tag: 'Profile',
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/moi.jpg'),
                                radius: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bienvenue,',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            'Wacil Zekraoui',
                            style: GoogleFonts.poppins(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '1112765676',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TabbedPage(),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Text('Votre solde à payer',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      Text('59.99€',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const CardContractSection(title: 'Mes contrats'),
        const SizedBox(height: 10),
        BlocProvider<ActualityBloc>(
          create: (context) => ActualityBloc(GetActualityUseCase(
              GetActualityRepositoryImpl(
                  currentBailleurId: currentBailleurId))),
          child: const ActualityCardSection(title: 'Actualités'),
        )
      ],
    );
  }
}
