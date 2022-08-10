import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc() : super(GoogleInitial()) {
    on<GoogleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
