import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alert_event.dart';
part 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  AlertBloc() : super(ShowAlert()) {
    on<AlertEvent>((event, emit) {
      
    });
  }
}
