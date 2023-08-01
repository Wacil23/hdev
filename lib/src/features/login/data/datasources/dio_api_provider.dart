import 'package:dio/dio.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/src/features/login/data/datasources/token_interceptor.dart';

class DioApiProvider {
  final Dio _dio;
  final String currentBailleurId;
  final bool includeToken;
  final bool includeBailleur;

  DioApiProvider(
      {required this.currentBailleurId,
      this.includeToken = false,
      this.includeBailleur = true})
      : _dio = Dio(BaseOptions(baseUrl: apiBaseUrl)) {
    if (includeToken) {
      final String? token = AuthBox.getToken();
      if (token != null) {
        print({'PRIIINT2', token});
        _dio.interceptors.add(TokenInterceptor(
            currentBailleurId: currentBailleurId, token: token));
      }
    }
    if (includeBailleur) {
      _dio.interceptors
          .add(TokenInterceptor(currentBailleurId: currentBailleurId));
    }
  }

  Future<Map<String, dynamic>> get(String pathUrl,
      {Map<String, dynamic>? queryParams}) async {
    Response response = await _dio.get(pathUrl, queryParameters: queryParams);
    return response.data;
  }

  Future<Map<String, dynamic>> put(String pathUrl,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    Response response =
        await _dio.put(pathUrl, data: data, queryParameters: queryParams);
    return response.data;
  }

  Future<Map<String, dynamic>> post(String pathUrl,
      {dynamic data,
      Map<String, dynamic>? queryParams,
      Options? options}) async {
    Response response = await _dio.post(pathUrl,
        data: data, queryParameters: queryParams, options: options);
    return response.data;
  }

  Future<Map<String, dynamic>> delete(String pathUrl,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    Response response =
        await _dio.delete(pathUrl, data: data, queryParameters: queryParams);
    return response.data as Map<String, dynamic>;
  }
}
