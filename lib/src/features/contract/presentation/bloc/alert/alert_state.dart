part of 'alert_bloc.dart';

sealed class AlertState extends Equatable {
  const AlertState();
  
  @override
  List<Object> get props => [];
}

final class ShowAlert extends AlertState {
  
}
