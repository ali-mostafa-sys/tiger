
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/core/strings/failures_massage.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/get_user_info_usecaase.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/get_wheel_data_usecase.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/send_order_usecase.dart';
import 'package:tiger/features/fortune_wheel/domain/use_case/set_prize_usecase.dart';

part 'wheel_event.dart';

part 'wheel_state.dart';

class WheelBlocBloc extends Bloc<WheelEvent, WheelState> {
  static WheelBlocBloc get(context) => BlocProvider.of(context);

  final GetWheelDataUseCase getWheelDataUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;
  final SetPrizeUseCase setPrizeUseCase;
  final SendOrderUseCase sendOrderUseCase;

  final selected = BehaviorSubject<int>();
   UserInfoEntity? userInfoEntity;

  int reward = 0;
 // bool isPop=false;

  bool isState = false;

  List<int> wheelItems = [];
//200,400,500,600,700,100,300,800,900,99
  int shopValue = 0;

  List<int> shopItems = [300, 600, 1500, 3000, 6000, 13200];

  String buttonColor1 = '#6B5A7E';
  String buttonColor2 = '#5A4D68';

  bool isPressed = false;

  WheelBlocBloc(
      {required this.getWheelDataUseCase, required this.getUserInfoUseCase,required this.setPrizeUseCase,required this.sendOrderUseCase})
      : super(WheelBlocInitial()) {
    on<WheelEvent>((event, emit) async {
      if (event is GetWheelDataEvent) {
        emit(LoadingWheelDataState());

        final failureOrWheelData = await getWheelDataUseCase.call(event.token);

        failureOrWheelData.fold((failure)async {
          emit(ErrorWheelDataState(message: failureMessage(failure)));
        }, (data) async{
          data.map((e) async{
            wheelItems.add(e.ucValue);
          }).toList();
          emit(LoadedWheelDataState(wheelData: data));
        });
      }

      if (event is GetUserInfoEvent) {
      await  _failureOrGetInfo(event.token);
      }
      if(event is AddToPointsEvent){

       await _failureOrAddToPoints(reward,TOKEN.toString()).then((value) async{
         await  _failureOrGetInfo(TOKEN.toString());
       });
      }

      if(event is SendOrderEvent){
       await _failureOrSendOrder(shopValue,TOKEN.toString()).then((value)async {
         await  _failureOrGetInfo(TOKEN.toString());
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
       // isPop=false;
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
  /// here for get user info
Future < void> _failureOrGetInfo(String token)async{
  emit(loadingGetUserInfoState());
  final failureOrGetInfo = await getUserInfoUseCase.call(token);
  failureOrGetInfo.fold((failure) async {
    emit(ErrorGetUserInfoState(error: failureMessage(failure)));
  }, (userInfo) async {
    userInfoEntity =  UserInfoEntity(
        firstName: userInfo.firstName,
        lastName: userInfo.lastName,
        email: userInfo.email,
        points: userInfo.points,
        numberOfRolls: userInfo.numberOfRolls);
    emit(loadedGetUserInfoState(userInfoEntity: userInfo));
  });
}
/// here for add to point
Future<void>_failureOrAddToPoints(int reward,String token)async{
  emit(LoadingAddToPointsState());

  final failureOrAddToPoints=await setPrizeUseCase.call( reward,  token);

  failureOrAddToPoints.fold(
          (failure) {

        emit(ErrorAddToPointsState(error: failureMessage(failure)));
      },
          (addToPoint) {


        emit(LoadedAddToPointsState());
      });
}

/// here for send order
  Future<void>_failureOrSendOrder(int usValue,String token)async{
    emit(LoadingSendOrderState());


    final failureOrAddToPoints=await sendOrderUseCase.call( usValue,  token);

    failureOrAddToPoints.fold(
            (failure) {

          emit(ErrorSendOrderState(error: failureMessage(failure)));
        },
            (addToPoint) {


          emit(LoadedSendOrderState());
        });
  }



}
