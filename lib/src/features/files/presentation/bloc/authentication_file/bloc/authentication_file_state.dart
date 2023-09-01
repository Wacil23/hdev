part of 'authentication_file_bloc.dart';

abstract class AuthenticationFileState extends Equatable {
  final FileLoginModel? responseModel;
  const AuthenticationFileState({this.responseModel});

  @override
  List<Object?> get props => [responseModel];
}

class AuthenticationFileInitial extends AuthenticationFileState {}

class AuthenticationFileLoading extends AuthenticationFileState {
  const AuthenticationFileLoading();
}

class AuthenticationFileSuccess extends AuthenticationFileState {
  const AuthenticationFileSuccess(FileLoginModel? user)
      : super(responseModel: user);
}

class AuthenticationFileError extends AuthenticationFileState {
  const AuthenticationFileError(FileLoginModel? error)
      : super(responseModel: error);
}
