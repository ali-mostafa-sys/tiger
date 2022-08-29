

import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/repositories/wheel_repository.dart';

class GetUserInfoUseCase{
  final WheelRepository wheelRepository;
  const GetUserInfoUseCase({required this.wheelRepository});
  Future <Either<Failure,UserInfoEntity>>call(String token)async{
    return await wheelRepository.getUserInfoData(token);
  }

}