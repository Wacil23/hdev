part of 'contract_history_bloc.dart';

abstract class ContractEvent extends Equatable {
  const ContractEvent();

  @override
  List<Object> get props => [];
}

class GetContratHistoryEvent extends ContractEvent {}
