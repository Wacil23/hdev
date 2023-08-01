import 'package:equatable/equatable.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/src/features/login/data/models/api_response.dart';

abstract class HomeContractState extends Equatable {
  final ContractsModel? contracts;
  final ApiResponseModel ? errors;
  const HomeContractState({this.contracts, this.errors});

  @override
  List<Object?> get props => [contracts, errors];
}

class HomeContractLoading extends HomeContractState {
  const HomeContractLoading();
}

class HomeContractDone extends HomeContractState {
  const HomeContractDone(contract)
      : super(contracts: contract);
}

class HomeContractError extends HomeContractState {
  const HomeContractError(ApiResponseModel? errors) : super(errors: errors);
}
