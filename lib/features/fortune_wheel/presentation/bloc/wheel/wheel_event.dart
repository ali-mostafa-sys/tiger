part of 'wheel_bloc.dart';

abstract class WheelEvent extends Equatable {
  const WheelEvent();

  @override
  List<Object> get props => [];
}

class GetWheelDataEvent extends WheelEvent {}

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
