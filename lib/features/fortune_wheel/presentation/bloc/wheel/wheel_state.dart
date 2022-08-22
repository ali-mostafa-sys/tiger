part of 'wheel_bloc.dart';

abstract class WheelState extends Equatable {
  const WheelState();

  @override
  List<Object> get props => [];
}

class WheelBlocInitial extends WheelState {}

class LoadingWheelDataState extends WheelState {}

////////////////////////////////////////////////////////////////
class LoadedWheelDataState extends WheelState {
  final List<WheelEntity> wheelData;

  const LoadedWheelDataState({required this.wheelData});

  @override
  List<Object> get props => [wheelData];
}

//////////////////////////////////////////////////////////////
class ErrorWheelDataState extends WheelState {
  final String message;

  const ErrorWheelDataState({required this.message});

  @override
  List<Object> get props => [message];
}
