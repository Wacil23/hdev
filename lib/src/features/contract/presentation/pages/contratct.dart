import 'package:flutter/material.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mes_avis_decheance/mes_avis_decheance.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mes_demandes_dintervention/mes_demandes_dintervention.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mes_documents/mes_documents.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mes_informations/mes_informations.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mes_modalites_de_paiement/mes_modalites_de_paiement.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/mon_solde.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';

class Contract extends StatelessWidget {
  final ContractsModel? contract;
  const Contract({super.key, this.contract});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Hero(
            tag: 'Profile',
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/moi.jpg'),
                  radius: 150,
                ),
              ),
            ),
          ),
        ));
  }
}
