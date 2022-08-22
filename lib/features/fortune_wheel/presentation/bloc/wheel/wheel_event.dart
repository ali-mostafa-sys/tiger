part of 'wheel_bloc.dart';

abstract class WheelEvent extends Equatable {
  const WheelEvent();

  @override
  List<Object> get props => [];
}

class GetWheelDataEvent extends WheelEvent{}
class RefreshWheelDataEvent extends WheelEvent{}
