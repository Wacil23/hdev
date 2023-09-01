part of 'authentication_file_bloc.dart';

abstract class AuthenticationFileEvent extends Equatable {
  const AuthenticationFileEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationSubmitEvent extends AuthenticationFileEvent {
  final String email;
  final String password;
  const AuthenticationSubmitEvent(this.email, this.password);
}
