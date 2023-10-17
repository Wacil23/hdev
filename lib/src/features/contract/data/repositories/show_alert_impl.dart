import 'package:dio/dio.dart';
import 'package:hdev/core/model/api_response.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/resources/dio_api_provider.dart';

class ShowAlertImpl {
  final DioApiProvider _apiProvider;
  ShowAlertImpl({String? currentBailleurId})
      : _apiProvider = DioApiProvider(
            currentBailleurId: currentBailleurId!,
            includeBailleur: true,
            includeToken: true);
              Future<DataState<ApiResponseModel>> getContractHistory(
      {required String numContract}) async {
    try {
      final httpResponse =
          await _apiProvider.get('/info/assurance/$numContract');
      final responseModel = ApiResponseModel(
        isSuccess: httpResponse["IsSuccess"],
        statusCode: httpResponse["StatusCode"],
        datas: httpResponse["Datas"],
        errors: httpResponse["Errors"],
      );
      if (responseModel.isSuccess) {
        return DataSuccess(ApiResponseModel(
            isSuccess: responseModel.isSuccess,
            statusCode: responseModel.statusCode,
            datas: responseModel.datas));
      } else {
        return DataFailed(ApiResponseModel(
            isSuccess: responseModel.isSuccess,
            statusCode: responseModel.statusCode,
            errors: responseModel.errors));
      }
    } on DioException catch (e) {
      return DataFailed(ApiResponseModel(
          errors: e.error,
          statusCode: e.response!.statusCode!,
          isSuccess: false));
    }
  }
}
