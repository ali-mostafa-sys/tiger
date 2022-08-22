import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/repositories/wheel_repository.dart';

class GetWheelDataUseCase {
  final WheelRepository wheelRepository;

  GetWheelDataUseCase(this.wheelRepository);
  
  Future <Either<Failure,List<WheelEntity>>> call() async{
    return await wheelRepository.getWheelData();
  }
}