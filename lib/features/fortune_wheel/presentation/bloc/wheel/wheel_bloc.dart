import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/get_wheel_data_usecase.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBlocBloc extends Bloc<WheelEvent, WheelState> {
  final GetWheelDataUseCase getWheelDataUseCase;

  WheelBlocBloc({required this.getWheelDataUseCase})
      : super(WheelBlocInitial()) {
    on<WheelEvent>((event, emit) async {
      if (WheelEvent is GetWheelDataEvent) {
        emit(LoadingWheelDataState());

        final failureOrWheelData = await getWheelDataUseCase.call();

        failureOrWheelData.fold(
          (failure) {
            emit(ErrorWheelDataState(message:failureMessage(failure) ));
          },
          (data) {
            emit(LoadedWheelDataState(wheelData: data));
          });
      }
    });
  }

  //function to know the type of failure
  String failureMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure :
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure :
        return EMPTY_CACH_FAILURE_MESSAGE;
      case OfflineFailure :
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'un Expected error , please try again later';
    }
  }
}
