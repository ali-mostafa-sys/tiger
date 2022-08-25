part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoadingRegisterState extends RegisterState {}

class LoadedRegisterState extends RegisterState {
  final UserDataEntity userDataEntity;

  const LoadedRegisterState({required this.userDataEntity});

  @override
  List<Object> get props => [userDataEntity];
}

class ErrorRegisterState extends RegisterState {
  final String error;

  const ErrorRegisterState({required this.error});

  @override
  List<Object> get props => [error];
}

class ObscureTextState extends RegisterState {
  final bool obscureText;

  const ObscureTextState({required this.obscureText});

  @override
  List<Object> get props => [obscureText];
}

class LoadingGetEmailAndFullNameState extends RegisterState {}

class LoadedGetEmailAndFullNameState extends RegisterState {}

class ErrorGetEmailAndFullNameState extends RegisterState {
  final String error;

  const ErrorGetEmailAndFullNameState({required this.error});

  @override
  List<Object> get props => [error];
}
