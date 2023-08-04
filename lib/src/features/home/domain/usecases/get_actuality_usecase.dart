import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/usecases/usecase.dart';
import 'package:hdev/src/features/home/data/repositories/get_actuality_repository_impl.dart';
import 'package:hdev/core/model/api_response.dart';

class GetActualityUseCase implements UseCase<DataState<ApiResponseModel>, void>{
  final GetActualityRepositoryImpl _getActualityRepositoryImpl;
  GetActualityUseCase(this._getActualityRepositoryImpl);

  @override
  Future<DataState<ApiResponseModel>> call({void params}){
    return _getActualityRepositoryImpl.getActuality();
  }
}