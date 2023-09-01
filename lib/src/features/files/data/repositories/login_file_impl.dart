import 'package:dio/dio.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/files/data/models/file_login.dart';
import 'package:hdev/src/features/login/data/models/login_params_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/resources/dio_api_provider.dart';

class LoginFileImpl {
  final DioApiProvider _apiProvider;

  LoginFileImpl()
      : _apiProvider = DioApiProvider(
            includeBailleur: false, includeToken: false, overrideUrl: true);

  Future<dynamic> login(
      {String? email, String? password}) async {
    try {
      // var url = Uri.https('auth-dev.picaraste.fr', '/login');
      final loginParams = LoginParams(email: email, password: password);
      // var response = await http.post(url,
      //     body: {'Login': loginParams.email, 'Password': loginParams.password});
      final httpResponse = await _apiProvider.post(
        '/login',
        data: {'Login': loginParams.email, 'Password': loginParams.password},
      );
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      // if(response.statusCode == 200){
      //   return true;
      // }
      final responseModel = FileLoginModel.fromMap(httpResponse);
      print(responseModel);
      if (responseModel.status == 200) {
        print({"success", responseModel.status});
        return DataSuccess(FileLoginModel(
          data: responseModel.data,
        ));
      } else {
          print('here11');
        return DataFailed(
          FileLoginModel(
              errorMessage: responseModel.hasError, data: responseModel.data),
        );
      }
    } on DioException catch (e) {
      print({'Eroor roor', e.message});
      print(DioException(
          requestOptions: e.requestOptions,
          error: e.error,
          message: e.message,
          response: e.response,
          stackTrace: e.stackTrace,
          type: e.type));
      return DataFailed(FileLoginModel(errorMessage: e.toString()));
    }
  }
}
