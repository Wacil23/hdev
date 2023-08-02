import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/activitiy/home_actuality.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/contracts/card_contract_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: const [
          CardContractSection(title: 'Mes contrats'),
          SizedBox(height: 70),
          HomeActuality(title: 'Actualités')
        ],
      ),
    );
  }
}
