import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/core/resources/data_state.dart';
import '../../../data/models/login_params_model.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase _loginUseCase;

  AuthenticationBloc(this._loginUseCase) : super(AuthenticationInitialState()) {
    on<AuthenticationSubmitEvent>(onLoginUser);
    on<LogoutEvent>(onLogoutEvent);
  }

  Future<void> onLoginUser(AuthenticationSubmitEvent event,
      Emitter<AuthenticationState> emit) async {
    if (event.email.isNotEmpty || event.password.isNotEmpty) {
      emit(const AuthenticationLoadingState());
      final loginParams =
          LoginParams(email: event.email, password: event.password);
      
      final loginResult = await _loginUseCase(params: loginParams);

      if (loginResult is DataSuccess && loginResult.data != null) {
        emit(AuthenticationAuthenticatedState(loginResult.data));
        AuthBox.setToken(state.responseModel?.datas['Token']);
      }

      if (loginResult is DataFailed) {
        emit(AuthenticationUnauthenticatedState(loginResult.error));
      }
    } else {
      emit(const AuthenticationErrorState());
    }
  }

  Future<void> onLogoutEvent(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    AuthBox.removeToken();
    emit(const AuthenticationUnauthenticatedState(null));
  }
}
