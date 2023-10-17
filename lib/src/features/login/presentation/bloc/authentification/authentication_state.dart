import 'package:equatable/equatable.dart';
import 'package:hdev/core/model/api_response.dart';

abstract class AuthenticationState extends Equatable {
  final ApiResponseModel? responseModel;
 const AuthenticationState({this.responseModel});
  @override
  List<Object?> get props => [responseModel];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {
   const AuthenticationAuthenticatedState(ApiResponseModel ? user) : super(responseModel: user);
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
   const AuthenticationUnauthenticatedState(ApiResponseModel? error) : super(responseModel: error);
}

class AuthenticationLoadingState extends AuthenticationState {
   const AuthenticationLoadingState();
}

class AuthenticationErrorState extends AuthenticationState {
   const AuthenticationErrorState();
}
