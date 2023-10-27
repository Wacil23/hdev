import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_state.dart';

class CardContractSection extends StatelessWidget {
  const CardContractSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeContractBloc = BlocProvider.of<HomeContractBloc>(context);
    homeContractBloc.add(const GetContracts());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<HomeContractBloc, HomeContractState>(
          builder: (_, state) {
            if (state is HomeContractLoading) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 242, 242, 242)),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromARGB(255, 230, 230, 230)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromARGB(255, 225, 225, 225)),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is HomeContractError) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.errors?.errors[0],
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            if (state is HomeContractDone) {
              var list = [state.contract!.adresseBien].toList();
              return SizedBox(
                height: 80, 
                child: ListView.builder(
                  
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 58, 119, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: const Icon(
                        Icons.home_work_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Column _cardMain(HomeContractState state) {
    final String? priceToString = state.contract?.soldeContrat.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text('Solde :',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            Row(
              children: [
                Text('$priceToString €',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'sous réserve de paiements en cours de traitement',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: -0.2),
        ),
      ],
    );
  }

  Row _cardHeader(HomeContractState state) {
    String? postalCodeNCity =
        '${state.contract?.codePostalBien} ${state.contract?.villeBien}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(116, 159, 238, 1),
              ),
              child: const Icon(Icons.file_copy, color: Colors.white, size: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              state.contract!.numContrat,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  state.contract!.adresseBien,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -0.2),
                ),
                Text(
                  postalCodeNCity,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -0.2),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
