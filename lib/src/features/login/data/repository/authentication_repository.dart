import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/core/resources/data_state.dart';

import '../../../../../core/resources/dio_api_provider.dart';
import '../../../../../core/model/api_response.dart';
import '../models/login_params_model.dart';

class AuthenticationRepositoryImpl {
  final DioApiProvider _apiProvider;

  AuthenticationRepositoryImpl()
      : _apiProvider = DioApiProvider(
            currentBailleurId: currentBailleurId,
            includeBailleur: true,
            includeToken: false);


  Future<DataState<ApiResponseModel>> login(
      {String? email, String? password}) async {
    try {
      
      final loginParams = LoginParams(email: email, password: password);

      final httpResponse = await _apiProvider.post(
        '/Auth/LogIn',
        data: {'email': loginParams.email, 'password': loginParams.password},
      );

      final responseModel = ApiResponseModel(
          datas: httpResponse["Datas"],
          isSuccess: httpResponse["IsSuccess"],
          statusCode: httpResponse["StatusCode"],
          errors: httpResponse["Errors"]);

      if (responseModel.isSuccess) {
        return DataSuccess(ApiResponseModel(
            datas: responseModel.datas,
            isSuccess: responseModel.isSuccess,
            statusCode: responseModel.statusCode));
      } else {
        return DataFailed(
          ApiResponseModel(
              errors: responseModel.errors[0],
              isSuccess: responseModel.isSuccess,
              statusCode: responseModel.statusCode),
        );
      }
    } on ApiResponseModel catch (e) {
      return DataFailed(ApiResponseModel(
          isSuccess: e.isSuccess, statusCode: e.statusCode, errors: e));
    }
  }
}
