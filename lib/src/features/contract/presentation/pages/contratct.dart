import 'package:flutter/material.dart';
import 'package:hdev/src/features/contract/presentation/widgets/cards/card_current_solde.dart';
import 'package:hdev/src/features/contract/presentation/widgets/cards/card_payment_solde.dart';
import 'package:hdev/src/features/contract/presentation/widgets/history_contract/history_contract.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/src/features/home/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/header/header_section.dart';
import 'package:hdev/src/features/home/presentation/widgets/drawer/home_drawer.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Contract extends StatelessWidget {
  final ContractsModel contract;
  Contract({super.key, required this.contract});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
          title: 'Contrat n° ${contract.numContrat}', needsPop: false),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeaderSection(
                  title: 'Mon solde', dividerColor: Colors.amber),
              const SizedBox(height: 20),
              CardCurrentSolde(contract: contract),
              const SizedBox(height: 20),
              CardPaymentSolde(contract: contract),
              const SizedBox(height: 50),
              const HeaderSection(
                  title: 'Mon historique', dividerColor: Colors.amber),
              const SizedBox(height: 20),
              HistoryContract(contract: contract)
            ]),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            label: 'Mon solde',
            icon: Icon(Icons.favorite),
          ),
         
          BottomNavigationBarItem(
            label: 'Mes modalités de paiement',
            icon: Icon(Icons.location_on),
          ),
      
          BottomNavigationBarItem(
            label: 'Mes avis d\'échéance',
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            label: 'Mes demandes d\'intervention',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }
}
