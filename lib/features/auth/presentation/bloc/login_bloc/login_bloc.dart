import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/auth/domain/entity/google_entity.dart';
import 'package:tiger/features/auth/domain/entity/login_entity.dart';
import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';
import 'package:tiger/features/auth/domain/use_case/google_use_case.dart';
import 'package:tiger/features/auth/domain/use_case/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);

  final LoginUseCase loginUseCase;
  final SharedPreferences sharedPreferences;
  final GoogleUseCase googleUseCase;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool obscureText = true;

  TextEditingController email = TextEditingController();

  LoginBloc(
      {required this.loginUseCase,
      required this.sharedPreferences,
      required this.googleUseCase})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonEvent) {
        emit(LoadingLoginState());
        final failureOrLogin = await loginUseCase(event.loginEntity);

        failureOrLogin.fold((failure) async {
          emit(ErrorLoginState(error: _mapFailureToMessage(failure)));
        }, (login) async {
          TOKEN = sharedPreferences.getString('USER_TOKEN').toString();
          invitationCode =
              sharedPreferences.getString('INVITATION_CODE').toString();
          emit(LoadedLoginState(userDataEntity: login));
        });
      }
      if (event is ObscureTextEvent) {
        obscureText = !obscureText;
        emit(ObscureTextState(obscureText: obscureText));
      }
      if (event is GetEmailAndFullNameEvent) {
        emit(LoadingGetEmailAndFullNameState());
        final failureOrGetEmail = await googleUseCase();
        _getEmailFunction(failureOrGetEmail).then((value) async {
          await _googleSignIn.disconnect();
        });
      }
    });
  }

  Future _getEmailFunction(
      Either<Failure, GoogleEntity> failureOrGetEmail) async {
    failureOrGetEmail.fold((failure) async {
      emit(ErrorGetEmailAndFullNameState(error: _mapFailureToMessage(failure)));
    }, (getEmail) async {
      email.text = getEmail.email;
      print(email.text);
      emit(LoadedGetEmailAndFullNameState());
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
