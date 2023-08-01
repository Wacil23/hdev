import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/login/data/datasources/dio_api_provider.dart';
import 'package:hdev/src/features/login/data/models/api_response.dart';

class GetContractsRepositoryImpl {
  final DioApiProvider _apiProvider;

  GetContractsRepositoryImpl({required String currentBailleurId})
      : _apiProvider = DioApiProvider(
            currentBailleurId: currentBailleurId,
            includeBailleur: true,
            includeToken: true);

  Future<DataState<ApiResponseModel>> getContracts() async {
    try {
    print({"bailleur": currentBailleurId});
      final httpResponse =
          await _apiProvider.get('/Contrats/188154');
      final responseModel = ApiResponseModel(
        isSuccess: httpResponse["IsSuccess"],
        statusCode: httpResponse["StatusCode"],
        datas: httpResponse["Datas"],
        errors: httpResponse["Errors"],
      );
      
      if (responseModel.isSuccess) {
        return DataSuccess(ApiResponseModel(isSuccess: responseModel.isSuccess, statusCode: responseModel.statusCode, datas: responseModel.datas));
      } else {
        print({"voici l'errur ": responseModel});
        return DataFailed(responseModel);
      }
    } on ApiResponseModel catch (e) {
      return e.errors;
    }
  }
}
