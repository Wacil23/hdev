import 'package:flutter/material.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mes_informations/mes_informations.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/mon_solde.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/src/features/home/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:hdev/src/features/home/presentation/widgets/drawer/home_drawer.dart';

class Contract extends StatelessWidget {
  final ContractsModel? contract;
  const Contract({super.key, this.contract});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: HomeAppBar(
            title: 'Contrat n° ${contract?.numContrat}', showTab: true),
        body: TabBarView(
          children: [
            MonSolde(contract: contract),
             MesInformations(),
            const Icon(Icons.directions_bike),
            const Icon(Icons.directions_bike),
            const Icon(Icons.directions_bike),
            const Icon(Icons.directions_bike),
          ],
        ),
        drawer: const HomeDrawer(),
      ),
    );
  }
}

