import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/auth/domain/entity/login_entity.dart';
import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';
import 'package:tiger/features/auth/domain/use_case/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context)=>BlocProvider.of(context);

  final LoginUseCase loginUseCase;
  final SharedPreferences sharedPreferences;
  bool obscureText=true;



  LoginBloc({required this.loginUseCase,required this.sharedPreferences}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{

      if(event is LoginButtonEvent){
        emit(LoadingLoginState());
        final failureOrLogin= await loginUseCase(event.loginEntity);
        failureOrLogin.fold(
                (failure) {
                  emit(ErrorLoginState(error: _mapFailureToMessage(failure)));


                },
                (login) async{
                  TOKEN=await sharedPreferences.getString('USER_TOKEN').toString();
                  emit(LoadedLoginState(userDataEntity: login));

                });


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
