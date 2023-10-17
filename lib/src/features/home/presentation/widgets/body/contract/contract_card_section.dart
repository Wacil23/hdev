import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_state.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/header/header_section.dart';

class CardContractSection extends StatelessWidget {
  final String title;
  const CardContractSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final homeContractBloc = BlocProvider.of<HomeContractBloc>(context);
    homeContractBloc.add(const GetContracts());
    return Container(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: title,
          dividerColor: Colors.amber,
        ),
        BlocBuilder<HomeContractBloc, HomeContractState>(
          builder: (_, state) {
            if (state is HomeContractLoading) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 2,
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            _cardHeader(state),
                            const SizedBox(height: 20),
                            _cardMain(state),
                            const SizedBox(height: 15),
                            _cardPayment(state),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ],
    ));
  }

  Column _cardMain(HomeContractState state) {
    final String? priceToString = state.contracts?.soldeContrat.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              children: [
                Text('Solde :',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Text('$priceToString €',
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          'sous réserve de paiements en cours de traitement',
          style: TextStyle(
              color: Color.fromRGBO(102, 102, 118, 1),
              fontStyle: FontStyle.italic,
              fontSize: 13),
        ),
      ],
    );
  }

  Row _cardHeader(HomeContractState state) {
    String? postalCodeNCity =
        '${state.contracts?.codePostalBien} ${state.contracts?.villeBien}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(Icons.file_copy, color: Colors.amber),
            ),
            Text(
              state.contracts!.numContrat,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  state.contracts!.adresseBien,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Text(
                  postalCodeNCity,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Row _cardPayment(HomeContractState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(126, 161, 26, 1))),
                    child: const Text('Effectuer un paiement'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
