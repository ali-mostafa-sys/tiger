part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLoginState extends LoginState {}

class LoadedLoginState extends LoginState {
  final UserDataEntity userDataEntity;

  const LoadedLoginState({required this.userDataEntity});

  @override
  List<Object> get props => [userDataEntity];
}

class ErrorLoginState extends LoginState {
  final String error;

  const ErrorLoginState({required this.error});

  @override
  List<Object> get props => [error];
}

class ObscureTextState extends LoginState{
  final bool obscureText;
  const ObscureTextState({required this.obscureText});
  @override
  List<Object> get props=>[obscureText];
}
