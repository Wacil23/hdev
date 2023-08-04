import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/core/usecases/usecase.dart';
import 'package:hdev/core/model/api_response.dart';
import 'package:hdev/src/features/login/data/models/login_params_model.dart';
import 'package:hdev/src/features/login/data/repository/authentication_repository.dart';


class LoginUseCase implements UseCase<DataState<ApiResponseModel>, LoginParams> {

  final AuthenticationRepositoryImpl _authenticationRepository;
  LoginUseCase(this._authenticationRepository);


  @override
  Future<DataState<ApiResponseModel>> call({LoginParams ? params}) {
    return _authenticationRepository.login(email: params?.email, password: params?.password);
  }
}


