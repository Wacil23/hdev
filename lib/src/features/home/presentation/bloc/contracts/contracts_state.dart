import 'package:equatable/equatable.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/core/model/api_response.dart';

abstract class HomeContractState extends Equatable {
  final ContractsModel? contract;
  final ApiResponseModel ? errors;
  const HomeContractState({this.errors, this.contract});

  @override
  List<Object?> get props => [errors, contract];
}

class HomeContractLoading extends HomeContractState {
  const HomeContractLoading();
}

class HomeContractDone extends HomeContractState {
  const HomeContractDone(contract)
      : super(contract: contract);
}

class HomeContractError extends HomeContractState {
  const HomeContractError(ApiResponseModel? errors) : super(errors: errors);
}
