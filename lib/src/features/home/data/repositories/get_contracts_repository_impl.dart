import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/resources/dio_api_provider.dart';
import 'package:hdev/core/model/api_response.dart';

class GetContractsRepositoryImpl {
  final DioApiProvider _apiProvider;

  GetContractsRepositoryImpl({String? currentBailleurId})
      : _apiProvider = DioApiProvider(
            currentBailleurId: currentBailleurId!,
            includeBailleur: true,
            includeToken: true);

  Future<DataState<ApiResponseModel>> getContracts() async {
    try {
      final httpResponse = await _apiProvider.get('/Contrats/188154');
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
      if (e.response!.statusCode == 401) {
        AuthBox.removeToken();
        Navigator.defaultRouteName;
      }
      return DataFailed(ApiResponseModel(
          errors: e.error,
          statusCode: e.response!.statusCode!,
          isSuccess: false));
    }
  }
}
