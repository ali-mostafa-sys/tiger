import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mac_address/mac_address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/auth/domain/entity/google_entity.dart';
import 'package:tiger/features/auth/domain/entity/register_entity.dart';
import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';
import 'package:tiger/features/auth/domain/use_case/google_use_case.dart';
import 'package:tiger/features/auth/domain/use_case/register_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  static RegisterBloc get(context) => BlocProvider.of(context);
  final RegisterUseCase registerUseCase;
  final SharedPreferences sharedPreferences;
  final GoogleUseCase googleUseCase;
  bool obscureText = true;
  String firstName = '';
  String lastName = '';
  String macAddress = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController email = TextEditingController();

  RegisterBloc({
    required this.registerUseCase,
    required this.sharedPreferences,
    required this.googleUseCase,
  }) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterButtonEvent) {
        emit(LoadingRegisterState());
        final failureOrRegister = await registerUseCase(event.registerEntity);
        final getMacAddress = await GetMac.macAddress;
        macAddress = getMacAddress.toString();

        failureOrRegister.fold((failure) async {
          emit(ErrorRegisterState(error: _mapFailureToMessage(failure)));
        }, (register) async {
          TOKEN = sharedPreferences.getString('USER_TOKEN').toString();
          invitationCode =
              sharedPreferences.getString('INVITATION_CODE').toString();
          emit(LoadedRegisterState(userDataEntity: register));
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
      firstName = getEmail.firstName;
      lastName = getEmail.lastName;
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
