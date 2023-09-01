import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/files/data/models/file_login.dart';
import 'package:hdev/src/features/files/domain/usecases/login_file_usecase.dart';
import 'package:hdev/src/features/login/data/models/login_params_model.dart';
part 'authentication_file_event.dart';
part 'authentication_file_state.dart';

class AuthenticationFileBloc
    extends Bloc<AuthenticationFileEvent, AuthenticationFileState> {
  final LoginFileUseCase _loginFileUseCase;

  AuthenticationFileBloc(this._loginFileUseCase)
      : super(AuthenticationFileInitial()) {
    on<AuthenticationSubmitEvent>(onLoginFile);
  }
  Future<void> onLoginFile(AuthenticationSubmitEvent event,
      Emitter<AuthenticationFileState> emit) async {
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      emit(const AuthenticationFileLoading());
      print({'here there is 1', event.email, event.password});
      final loginParams =
          LoginParams(email: event.email, password: event.password);
      final loginResult = await _loginFileUseCase(params: loginParams);

      print({'here there is 2', loginResult.data?.errorMessage});
      if (loginResult is DataSuccess && loginResult.data != null) {
        emit(AuthenticationFileSuccess(loginResult.data));
        AuthBox.setFileToken(state.responseModel!.data);
        print({'Token File', AuthBox.getFileToken()});
      }
      if (loginResult is DataFailed) {
        AuthBox.removeFileToken();
        emit(AuthenticationFileError(loginResult.error));
      }
    }
  }
}
