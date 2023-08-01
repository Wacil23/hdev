import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/login/data/jwt/decode_token.dart';
import '../../../data/models/login_params_model.dart';
import '../../../data/models/token_model.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

//Class principal qui gère la logique métier.
//Event comment type d'evenement, state comme type d'état.

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase _loginUseCase;

  AuthenticationBloc(this._loginUseCase) : super(AuthenticationInitialState()) {
    on<AuthenticationSubmitEvent>(onLoginUser);
    on<LogoutEvent>(onLogoutEvent);
    on<CheckTokenEvent>(onCheckedToken);
  }

  Future<void> onLoginUser(AuthenticationSubmitEvent event,
      Emitter<AuthenticationState> emit) async {
    if (event.email.isNotEmpty || event.password.isNotEmpty) {
      emit(const AuthenticationLoadingState());
      final loginParams =
          LoginParams(email: event.email, password: event.password);
      final loginResult = await _loginUseCase(params: loginParams);

      if (loginResult is DataSuccess && loginResult.data != null) {
        final tokenValue = loginResult.data?.datas['Token'];
        final tokenPayload = TokenModel.fromJwt(tokenValue);

        emit(AuthenticationAuthenticatedState(loginResult.data,
            TokenModel(tokenValue: tokenValue, tokenPayload: tokenPayload)));
        AuthBox.setToken(state.token!.tokenValue);
      }

      if (loginResult is DataFailed) {
        emit(AuthenticationUnauthenticatedState(loginResult.error, null));
      }
    } else {
      emit(const AuthenticationErrorState());
    }
  }

  Future<void> onLogoutEvent(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    AuthBox.removeToken();
    emit(const AuthenticationUnauthenticatedState(null, null));
  }

  Future<void> onCheckedToken(
      CheckTokenEvent event, Emitter<AuthenticationState> emit) async {
    final String? token = AuthBox.getToken();
    if (token != null && isTokenExpired(token)) {
      AuthBox.removeToken();
      emit(const AuthenticationUnauthenticatedState(null, null));
    }
  }

  bool isTokenExpired(String token) {
    final decodedToken = parseJwtPayLoad(token);
    return DateTime.now().isAfter(decodedToken.expirationDate);
  }
}
