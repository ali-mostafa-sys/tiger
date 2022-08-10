part of 'google_bloc.dart';

abstract class GoogleState extends Equatable {
  const GoogleState();
  @override
  List<Object> get props => [];
}

class GoogleInitial extends GoogleState {
  @override
  List<Object> get props => [];
}
class GoogleLoadingState extends GoogleState{}
class GoogleLoadedState extends GoogleState{}
class GoogleErrorState extends GoogleState{}
