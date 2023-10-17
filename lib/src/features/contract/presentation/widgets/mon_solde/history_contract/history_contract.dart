import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/src/features/contract/data/repositories/get_contract_history_impl.dart';
import 'package:hdev/src/features/contract/domain/usecases/get_contract_history_usecase.dart';
import 'package:hdev/src/features/contract/presentation/bloc/history/contract_history_bloc.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';

class HistoryContract extends StatelessWidget {
  const HistoryContract({
    super.key,
    required this.contract,
  });

  final ContractsModel contract;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContractHistoryBloc>(
      create: (context) {
        final contractHistoryBloc = ContractHistoryBloc(
            GetContractHistoryUseCase(
                GetContractHistoryImpl(currentBailleurId: currentBailleurId)),
            contract);
        contractHistoryBloc.add(GetContratHistoryEvent());
        return contractHistoryBloc;
      },
      child: BlocBuilder<ContractHistoryBloc, ContractHistoryState>(
        builder: (context, state) {
          if (state is ContractHistoryLoading) {
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

          if (state is ContractHistoryDone) {
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.contractHistory?.length,
              itemBuilder: (context, index) {
                final contractItem = state.contractHistory?[index];
                String? dateString =
                    state.contractHistory?[index].dateOperation;
                DateTime dateTime = DateTime.parse(dateString!);
                int day = dateTime.day;
                int month = dateTime.month;
                int year = dateTime.year;

                String dateOperation = '$day/$month/$year';
                return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Hero(
                              tag: 'label-${contractItem.operationLabel}',
                              child: Text(contractItem.operationLabel),
                            ),
                          );
                        });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateOperation,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontSize: 12),
                            ),
                            Hero(
                              tag: 'label-${contractItem!.operationLabel}',
                              child: Text(
                                contractItem.operationLabel,
                                style: const TextStyle(fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          '${contractItem.amount} €',
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Text('');
        },
      ),
    );
  }
}
