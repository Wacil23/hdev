import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/usecases/usecase.dart';
import 'package:hdev/src/features/home/data/repositories/get_contracts_repository_impl.dart';
import 'package:hdev/core/model/api_response.dart';

class GetContractsUseCase implements UseCase<DataState<ApiResponseModel>, void>{
  final GetContractsRepositoryImpl _contractsRepositoryImpl;
  GetContractsUseCase(this._contractsRepositoryImpl);

  @override
  Future<DataState<ApiResponseModel>> call({void params}){
    return _contractsRepositoryImpl.getContracts();
  }
}