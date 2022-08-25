part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonEvent extends LoginEvent {
  final LoginEntity loginEntity;

  const LoginButtonEvent({required this.loginEntity});

  @override
  List<Object> get props => [loginEntity];
}

class ObscureTextEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class GetEmailAndFullNameEvent extends LoginEvent {}
