class ApiResponseModel {
  final dynamic datas;
  final bool isSuccess;
  final int statusCode;
  final dynamic errors;

  ApiResponseModel({this.datas, required this.isSuccess, this.errors, required this.statusCode});
}
