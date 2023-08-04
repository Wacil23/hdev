import 'package:equatable/equatable.dart';
import 'package:hdev/core/model/api_response.dart';
import 'package:hdev/src/features/home/data/models/actuality_model.dart';

abstract class ActualityState extends Equatable {
  final ActualityModel ? actuality;
  final ApiResponseModel ? error;
  const ActualityState({this.actuality, this.error});
  
  @override
  List<Object> get props => [actuality!];
}

class ActualityLoading extends ActualityState {
  const ActualityLoading();
}
class ActualityDone extends ActualityState {
  const ActualityDone(actuality) : super(actuality: actuality);
}
class ActualityError extends ActualityState {
  const ActualityError(error) : super(error: error);
}
