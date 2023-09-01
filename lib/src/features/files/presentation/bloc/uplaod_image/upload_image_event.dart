part of 'upload_image_bloc.dart';

abstract class UploadImageEvent extends Equatable {
  const UploadImageEvent();

  @override
  List<Object> get props => [];
}

class StartUploadImageEvent extends UploadImageEvent {
  final File fileToUpload;

  const StartUploadImageEvent(this.fileToUpload);

  @override
  List<Object> get props => [fileToUpload];
}
