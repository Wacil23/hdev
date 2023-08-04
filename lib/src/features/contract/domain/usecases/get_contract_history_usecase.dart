import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/usecases/usecase.dart';
import 'package:hdev/src/features/contract/data/repositories/get_contract_history_impl.dart';
import 'package:hdev/src/features/home/data/models/contracts_model.dart';
import 'package:hdev/core/model/api_response.dart';

class GetContractHistoryUseCase implements UseCase<DataState<ApiResponseModel>, ContractsModel>{
  final GetContractHistoryImpl _getContractHistoryImpl;
  GetContractHistoryUseCase(this._getContractHistoryImpl);

  @override
  Future<DataState<ApiResponseModel>> call({ContractsModel ? params}){
    print(params!.numContrat);
    return _getContractHistoryImpl.getContractHistory(numContract: params!.numContrat);
  }
}