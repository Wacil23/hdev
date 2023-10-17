import 'package:flutter/material.dart';
import 'package:hdev/src/features/contract/presentation/widgets/alert/alert.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/cards/card_current_solde.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/cards/card_payment_solde.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/history_contract/history_contract.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/header/header_section.dart';

class MonSolde extends StatelessWidget {
  const MonSolde({
    super.key,
    required this.contract,
  });

  final ContractsModel? contract;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (contract != null) ...[
                const SizedBox(height: 20),
                Alert(),
                const SizedBox(height: 50),
                const HeaderSection(
                    title: 'Mon solde', dividerColor: Colors.amber),
                const SizedBox(height: 20),
                CardCurrentSolde(contract: contract!),
                const SizedBox(height: 20),
                CardPaymentSolde(contract: contract!),
                const SizedBox(height: 50),
                const HeaderSection(
                    title: 'Mon historique',
                    dividerColor: Colors.amber),
                const SizedBox(height: 20),
                HistoryContract(contract: contract!)
              ]
            ]),
      ),
    ]);
  }
}