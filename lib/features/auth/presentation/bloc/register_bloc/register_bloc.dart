import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/auth/domain/entity/register_entity.dart';
import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';
import 'package:tiger/features/auth/domain/use_case/register_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  static RegisterBloc get(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase;
  bool obscureText=true;

  RegisterBloc({
    required this.registerUseCase,
  }) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterButtonEvent) {
        emit(LoadingRegisterState());
        final failureOrRegister = await registerUseCase(event.registerEntity);
        failureOrRegister.fold(
                (failure) {
                  emit(ErrorRegisterState(error: _mapFailureToMessage(failure)));
                },
                (register) {
                  emit(LoadedRegisterState(userDataEntity: register));
                }
                );
      }
      if(event is ObscureTextEvent){
        obscureText=!obscureText;
        emit(ObscureTextState(obscureText: obscureText));
      }
    });
  }
  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
