part of 'upload_image_bloc.dart';

abstract class UploadImageState extends Equatable {
  final FileUploadModel? fileUpload;
  final ApiResponseModel? errors;
  const UploadImageState({this.fileUpload, this.errors});
  @override
  List<Object> get props => [fileUpload!, errors!];
}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {
  final double progress;
  const UploadImageLoading(this.progress);
}

class UploadImageSuccess extends UploadImageState {
  const UploadImageSuccess(FileUploadModel? fileUpload)
      : super(fileUpload: fileUpload);
}

class UploadImageError extends UploadImageState {
  const UploadImageError(ApiResponseModel? error) : super(errors: error);
}
