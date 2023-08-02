import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final String currentBailleurId;
  final bool includeToken;
  final String? token;
  final bool includeBailleur;

  TokenInterceptor(
      {required this.currentBailleurId,
      this.includeToken = false,
      this.includeBailleur = true,
      this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    if (includeBailleur) {
      options.headers['CURRENT_BAILLEUR_ID'] = currentBailleurId;
    }
    options.headers['Content-Type'] = "application/json";
    super.onRequest(options, handler);
  }
}
