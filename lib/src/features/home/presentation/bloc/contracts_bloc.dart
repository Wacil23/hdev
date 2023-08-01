import 'package:bloc/bloc.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/src/features/home/domain/usecases/get_contracts_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_state.dart';

class HomeContractBloc extends Bloc<HomeContractEvent, HomeContractState> {
  final GetContractsUseCase _getContractsUseCase;

  HomeContractBloc(this._getContractsUseCase) : super(const HomeContractLoading()) {
    on<GetContracts>(onGetContracts);
  }
  void onGetContracts(
      GetContracts event, Emitter<HomeContractState> emit) async {
    final dataState = await _getContractsUseCase();
    print({"you are", dataState});

    if (dataState is DataSuccess && dataState.data!.isSuccess) {
      print(dataState.data?.datas);
      final a = ContractsModel.fromMap(dataState.data!.datas[0]);
      print({"a", a.adresseBien});
      emit(HomeContractDone(a));
    }

    if (dataState is DataFailed) {
      emit(HomeContractError(dataState.data?.errors));
    }
  }
}
