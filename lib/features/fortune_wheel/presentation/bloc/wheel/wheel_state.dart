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

//////////////////////////////////////////////////
class PressWheelButtonState extends WheelState {}

class ShowUcValueDialogState extends WheelState {
  final int reward;
  const ShowUcValueDialogState({required this.reward});
  @override
  List<Object> get props => [reward];
}

/////////////////////////////////////////////////

class ShowShopDialogState extends WheelState {
  final bool isState;

  const ShowShopDialogState(this.isState);
  @override
  List<Object> get props => [isState];
}

///////////////////////////////////////////////////
class PickShopItemState extends WheelState {
  final bool isState;

  const PickShopItemState(this.isState);
  @override
  List<Object> get props => [isState];
}
/// here for get user info
 class loadingGetUserInfoState extends WheelState{}

 class loadedGetUserInfoState extends WheelState{
  final UserInfoEntity userInfoEntity;

const  loadedGetUserInfoState({required this.userInfoEntity});
  @override
  List<Object> get props => [userInfoEntity];
 }

 class ErrorGetUserInfoState extends WheelState{
  final String error;

 const ErrorGetUserInfoState({required this.error});
  @override
  List<Object> get props => [error];
 }