part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class RegisterButtonEvent extends RegisterEvent{
  final RegisterEntity registerEntity;

 const RegisterButtonEvent({required this.registerEntity});
  @override
  List<Object> get props => [registerEntity];
}

class ObscureTextEvent extends RegisterEvent{
  @override
  List<Object> get props => [];
}
class GetEmailAndFullNameEvent extends RegisterEvent{
  @override
  List<Object> get props => [];
}
