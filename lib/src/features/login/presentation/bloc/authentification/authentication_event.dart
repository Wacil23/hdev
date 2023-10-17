abstract class AuthenticationEvent {
  @override
  List<Object> get props => [];
}

//Reprensente les evenements liés à l'authentification (email, password)
class AuthenticationSubmitEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSubmitEvent(this.email, this.password);
}

class LogoutEvent extends AuthenticationEvent {
  LogoutEvent();
}
