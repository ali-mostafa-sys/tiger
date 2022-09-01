part of 'wheel_bloc.dart';

abstract class WheelEvent extends Equatable {
  const WheelEvent();

  @override
  List<Object> get props => [];
}

class GetWheelDataEvent extends WheelEvent {
  final String token;

 const GetWheelDataEvent({required this.token});
  @override
  List<Object> get props => [token];
}

class RefreshWheelDataEvent extends WheelEvent {}

class PressWheelButtonEvent extends WheelEvent {}

class ShowUcValueDialogEvent extends WheelEvent {}

class ShowShopDialogEvent extends WheelEvent {}

//////////////////////////////////////////////
class PickShopItemEvent extends WheelEvent {
   final int shopValue;

  const PickShopItemEvent({required this.shopValue});
  @override
  List<Object> get props => [shopValue];
}

class GetUserInfoEvent extends WheelEvent{
  final String token;

const  GetUserInfoEvent({required this.token});
  @override
  List<Object> get props => [token];
}


/// for add to points
 class AddToPointsEvent extends WheelEvent{ }


 // here for send Order
 class SendOrderEvent extends WheelEvent{ }