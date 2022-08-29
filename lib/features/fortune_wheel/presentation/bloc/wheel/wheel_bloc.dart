import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/get_user_info_usecaase.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/get_wheel_data_usecase.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBlocBloc extends Bloc<WheelEvent, WheelState> {
  static WheelBlocBloc get(context) => BlocProvider.of(context);

  final GetWheelDataUseCase getWheelDataUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;

  final selected = BehaviorSubject<int>();

  int reward = 0;

  bool isState = false;

  List<int> wheelItems = [100, 1000, 500, 200, 300, 350, 50, 80, 50, 60];

  int shopValue = 0;

  List<int> shopItems = [50, 100, 200, 300, 400, 500];

  String buttonColor1 = '#6B5A7E';
  String buttonColor2 = '#5A4D68';

  bool isPressed = false;

  WheelBlocBloc({required this.getWheelDataUseCase,required this.getUserInfoUseCase})
      : super(WheelBlocInitial()) {
    on<WheelEvent>((event, emit) async {
      if (event is GetWheelDataEvent) {
        emit(LoadingWheelDataState());

        final failureOrWheelData = await getWheelDataUseCase.call();

        failureOrWheelData.fold((failure) {
          emit(ErrorWheelDataState(message: failureMessage(failure)));
        }, (data) {
          emit(LoadedWheelDataState(wheelData: data));
        });
      }
      //TODO: HERE TO IMPLEMENT IN FIRST CALL OF BLOC
      if(event is GetUserInfoEvent){
        emit(loadingGetUserInfoState());
        final failureOrGetInfo=await getUserInfoUseCase.call(event.token);
        failureOrGetInfo.fold(
                (failure) {

                  emit(ErrorGetUserInfoState(error: failureMessage(failure)));
            },
                (userInfo) {
                  emit(loadedGetUserInfoState(userInfoEntity: userInfo));

                });
      }

      if (event is PressWheelButtonEvent) {
        selected.add(Fortune.randomInt(0, wheelItems.length));
        buttonColor1 = '#656565';
        buttonColor2 = '#464646';
        isPressed = true;
        emit(PressWheelButtonState());
      }

      if (event is ShowUcValueDialogEvent) {
        reward = wheelItems[selected.value];
        buttonColor1 = '#6B5A7E';
        buttonColor2 = '#5A4D68';
        isPressed = false;
        emit(ShowUcValueDialogState(reward: reward));
      }

      if (event is ShowShopDialogEvent) {
        isState = !isState;
        emit(ShowShopDialogState(isState));
      }

      if (event is PickShopItemEvent) {
        shopValue = event.shopValue;
        isState = !isState;
        emit(PickShopItemState(isState));
      }
    });
  }

  //function to know the type of failure
  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACH_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'un Expected error , please try again later';
    }
  }
}
