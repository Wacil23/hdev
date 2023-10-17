import 'dart:async';

import 'package:dio/dio.dart';
import 'dart:io';

class DioApiInterceptor extends Interceptor {
  final String? currentBailleurId;
  final bool includeToken;
  final String? token;
  final bool includeBailleur;

  DioApiInterceptor(
      {this.currentBailleurId,
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
    LogInterceptor(requestBody: true);
    options.headers['Content-Type'] = "application/json";
    options.headers['Connection'] = 'close';
    options.headers['Accept'] = '*/*';
      print('coucouu');
    super.onRequest(options, handler);
  }

    @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 307) {
      String? redirectUrl = response.headers['location']?.first;
      if (redirectUrl != null) {
        Dio().request(redirectUrl)
            .then((newResponse) {
          handler.next(newResponse);
        }).catchError((error) {
          handler.reject(error);
        });
      }
    } else {
      super.onResponse(response, handler);
    }
  }

}
