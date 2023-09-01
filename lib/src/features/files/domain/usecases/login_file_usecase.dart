import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/usecases/usecase.dart';
import 'package:hdev/src/features/files/data/models/file_login.dart';
import 'package:hdev/src/features/files/data/repositories/login_file_impl.dart';
import 'package:hdev/src/features/login/data/models/login_params_model.dart';

class LoginFileUseCase
    implements UseCase<dynamic, LoginParams> {
  final LoginFileImpl _loginFileImpl;
  LoginFileUseCase(this._loginFileImpl);

  @override
  Future<dynamic> call({LoginParams? params}) {
    return _loginFileImpl.login(
        email: params!.email, password: params.password);
  }
}
