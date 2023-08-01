import 'package:dio/dio.dart';
import 'package:hdev/src/features/login/data/jwt/decode_token.dart';

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
    if (token != null && !isTokenExpired(token!)) {
      print({'token is': token});
      options.headers['Authorization'] = 'Bearer $token';
    }
    if (includeBailleur) {
      options.headers['CURRENT_BAILLEUR_ID'] = currentBailleurId;
    }
    options.headers['Content-Type'] = "application/json";
    super.onRequest(options, handler);
  }

  bool isTokenExpired(String token) {
    final decodedToken = parseJwtPayLoad(token);
    return DateTime.now().isAfter(decodedToken.expirationDate);
  }
}
