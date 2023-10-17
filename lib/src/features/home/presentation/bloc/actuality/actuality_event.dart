import 'package:equatable/equatable.dart';

abstract class ActualityEvent extends Equatable {
  const ActualityEvent();

  @override
  List<Object> get props => [];
}

class GetActualityEvent extends ActualityEvent {
  const GetActualityEvent();
}
