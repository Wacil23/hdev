part of 'toogle_password_bloc.dart';

abstract class TooglePasswordEvent extends Equatable {
  const TooglePasswordEvent();

  @override
  List<Object> get props => [];
}

class ToggleSubmitEvent extends TooglePasswordEvent {}