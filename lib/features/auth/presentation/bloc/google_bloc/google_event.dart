part of 'google_bloc.dart';

abstract class GoogleEvent extends Equatable {
  const GoogleEvent();
  @override
  List<Object> get props => [];
}
class GoogleLoginOrRegisterEvent extends GoogleEvent{}
