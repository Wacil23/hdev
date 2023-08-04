
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/resources/data_state.dart';
import 'package:hdev/src/features/home/data/models/actuality_model.dart';
import 'package:hdev/src/features/home/domain/usecases/get_actuality_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_state.dart';


class ActualityBloc extends Bloc<ActualityEvent, ActualityState> {
  final GetActualityUseCase _getActualityUseCase;
  ActualityBloc(this._getActualityUseCase) : super(const ActualityLoading()) {
    on<GetActualityEvent>(onGetActuality);
  }

  void onGetActuality(GetActualityEvent event, Emitter<ActualityState> emit) async {  
    final dataState = await _getActualityUseCase();

     if(dataState is DataSuccess){
      final actualityModel = ActualityModel.fromMap(dataState.data!.datas[0]);
      emit(ActualityDone(actualityModel));
     }

     if(dataState is DataFailed){
      emit(ActualityError(dataState.error));
     }
  }
}
