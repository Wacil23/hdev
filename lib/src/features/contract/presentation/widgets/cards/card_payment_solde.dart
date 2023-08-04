import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';

class CardPaymentSolde extends StatelessWidget {
  const CardPaymentSolde({
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
              Icon(Icons.lock_outline_rounded, color: Colors.amber),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Paiement sécurisé en ligne',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: _formPaymentContract(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Flexible(
                  child: Text(
                'En cliquant sur Payer, vous serez redirigé vers notre plateforme de paiement sécurisé.',
                style: TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
              ))
            ],
          ),
        ]),
      ),
    );
  }

  Form _formPaymentContract() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Saisissez votre montant',
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                    suffix: Icon(Icons.euro),
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veulliez saisir un montant';
                    }
                    final amount = double.parse(value);
                    if (amount > contract.soldeContrat) {
                      return 'Le montant doit être inférieur ou égal à ${contract.soldeContrat}';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text('Payer'),
          ),
        ],
      ),
    );
  }
}
