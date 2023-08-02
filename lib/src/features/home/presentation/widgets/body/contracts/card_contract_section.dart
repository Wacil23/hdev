import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_state.dart';

class CardContractSection extends StatelessWidget {
  final String title;
  const CardContractSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final homeContractBloc = BlocProvider.of<HomeContractBloc>(context);
    homeContractBloc.add(const GetContracts());
    return BlocBuilder<HomeContractBloc, HomeContractState>(
      builder: (_, state) {
        if (state is HomeContractLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is HomeContractError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is HomeContractDone) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerCardSection(title),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print({'Card cliqued'});
                },
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
    );
  }

  Column _cardMain(HomeContractState state) {
    final String? priceToString = state.contracts?.soldeContrat.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Solde',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('$priceToString €',
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'sous réserve de paiements en cours de traitement',
          style: TextStyle(
              color: Color.fromRGBO(102, 102, 118, 1),
              fontStyle: FontStyle.italic),
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
            Text(state.contracts!.numContrat),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  state.contracts!.adresseBien,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  postalCodeNCity,
                  style: const TextStyle(fontWeight: FontWeight.w600),
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
                    onPressed: () {
                      print({' paiement effectuer'});
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(20, 76, 151, 1))),
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

Column _headerCardSection(title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 80.0,
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10.0,
        width: 55,
        child: Divider(
          color: Colors.amber,
          thickness: 3,
        ),
      ),
    ],
  );
}
