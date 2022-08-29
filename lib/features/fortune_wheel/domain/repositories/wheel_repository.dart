import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';

abstract class WheelRepository {
  Future<Either<Failure, List<WheelEntity>>> getWheelData();

  Future<Either<Failure, Unit>> setPrize(WheelEntity wheelEntity);
  Future <Either<Failure,UserInfoEntity>> getUserInfoData(String token);
}
