part of 'contract_history_bloc.dart';

abstract class ContractHistoryState extends Equatable {
  final List<ContractHistoryModel>? contractHistory;
  final ApiResponseModel? errors;
  const ContractHistoryState({this.contractHistory, this.errors});

  @override
  List<Object> get props => [contractHistory!, errors!];
}

class ContractHistoryLoading extends ContractHistoryState {
  const ContractHistoryLoading();
}

class ContractHistoryDone extends ContractHistoryState {
  const ContractHistoryDone(List<ContractHistoryModel>  contractHistory)
      : super(contractHistory: contractHistory);
}

class ContractHistoryError extends ContractHistoryState {
  const ContractHistoryError(ApiResponseModel? error) : super(errors: error);
}
