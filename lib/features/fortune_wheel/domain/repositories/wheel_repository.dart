import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/notifications/notifications_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';

abstract class WheelRepository {
  Future<Either<Failure, List<WheelEntity>>> getWheelData(String token);

  Future<Either<Failure, Unit>> setPrize(int wheelEntity,String token);
  Future <Either<Failure,UserInfoEntity>> getUserInfoData(String token);
  Future <Either<Failure,List<NotificationsEntity>>> getNotifications(String token);
  Future<Either<Failure, Unit>> sendOrder(int ucValue,String token);


}
