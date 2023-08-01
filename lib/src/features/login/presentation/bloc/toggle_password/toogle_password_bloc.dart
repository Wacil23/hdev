import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toogle_password_event.dart';
part 'toogle_password_state.dart';

class TooglePasswordBloc
    extends Bloc<TooglePasswordEvent, TooglePasswordState> {
  TooglePasswordBloc() : super(const TooglePasswordInitialState(true)) {
    on<ToggleSubmitEvent>((event, emit) {
      emit(TooglePasswordInitialState(
          !(state as TooglePasswordInitialState).passwordChecked));
    });
  }
}
