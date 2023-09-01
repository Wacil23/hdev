import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';

class CardCurrentSolde extends StatelessWidget {
  const CardCurrentSolde({
    super.key,
    required this.contract,
  });

  final ContractsModel contract;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.credit_card,
                color: Colors.amber,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Votre solde actuel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text('sous réserve de paiements en cours de traitement')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '${contract.soldeContrat.toString()} €',
                style: const TextStyle(
                    color: Color.fromRGBO(20, 76, 151, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
