part of 'toogle_password_bloc.dart';

abstract class TooglePasswordState extends Equatable {
  const TooglePasswordState();

  @override
  List<Object> get props => [];
}

class TooglePasswordInitialState extends TooglePasswordState {
  final bool passwordChecked;
  @override
  const TooglePasswordInitialState(this.passwordChecked);

  @override
  List<Object> get props => [passwordChecked];
}

class TooglePasswordClicked extends TooglePasswordState {}
