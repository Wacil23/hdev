import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/model/api_response.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/contract/data/models/contract_history_model.dart';
import 'package:hdev/src/features/contract/domain/usecases/get_contract_history_usecase.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';

part 'contract_history_event.dart';
part 'contract_history_state.dart';

class ContractHistoryBloc extends Bloc<ContractEvent, ContractHistoryState> {
  final GetContractHistoryUseCase _getContractHistoryUseCase;
  final ContractsModel contractModel;
  ContractHistoryBloc(this._getContractHistoryUseCase, this.contractModel)
      : super(const ContractHistoryLoading()) {
    on<GetContratHistoryEvent>(onGetContratHistory);
  }

  void onGetContratHistory(
      GetContratHistoryEvent event, Emitter<ContractHistoryState> emit) async {
    final dataState = await _getContractHistoryUseCase(params: contractModel);

    if (dataState is DataSuccess && dataState.data!.isSuccess) {
      print(dataState.data!.datas);
      final List<ContractHistoryModel> contractHistoryList = [];
      for (final mapEntry in dataState.data!.datas) {
      final contractHistoryModel = ContractHistoryModel.fromMap(mapEntry);
      contractHistoryList.add(contractHistoryModel);
    }
    emit(ContractHistoryDone(contractHistoryList));

    }

    if (dataState is DataFailed) {
      print({'There is a problem', dataState});
      emit(ContractHistoryError(dataState.data?.errors));
    }
  }
}
