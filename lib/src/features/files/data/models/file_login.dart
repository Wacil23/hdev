class FileLoginModel {
  final int? status;
  final bool? hasError;
  final dynamic data;
  final dynamic errorMessage;
  const FileLoginModel(
      {this.data,
       this.status,
       this.hasError,
       this.errorMessage});
  factory FileLoginModel.fromMap(Map<String, dynamic> map) {
    return FileLoginModel(
      status: map["status"],
      hasError: map["hasError"],
      data: map['data'],
      errorMessage: map['errorMessage'],
    );
  }
}
