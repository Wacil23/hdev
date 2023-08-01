import 'package:equatable/equatable.dart';
import 'package:hdev/src/features/login/data/models/api_response.dart';

import '../../../data/models/token_model.dart';
//Class abstraite qui représente l'état de l'authentification
//Elle a 4 sous classes concrètes.
abstract class AuthenticationState extends Equatable {
  final ApiResponseModel? responseModel;
  final TokenModel ? token;

  const AuthenticationState({this.responseModel, this.token});

  @override
  List<Object?> get props => [responseModel, token];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {
  const AuthenticationAuthenticatedState(ApiResponseModel ? user, TokenModel ? token) : super(responseModel: user, token: token);
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  const AuthenticationUnauthenticatedState(ApiResponseModel? error, TokenModel ? token) : super(responseModel: error, token: token);
}

class AuthenticationLoadingState extends AuthenticationState {
  const AuthenticationLoadingState();
}

class AuthenticationErrorState extends AuthenticationState {
  const AuthenticationErrorState();
}
