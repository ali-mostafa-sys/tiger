import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';

import 'package:tiger/features/fortune_wheel/domain/repositories/wheel_repository.dart';

class SetPrizeUseCase {
  final WheelRepository wheelRepository;

  SetPrizeUseCase(this.wheelRepository);

  Future<Either<Failure, Unit>> call( int wheelEntity, String token) async {
    return await wheelRepository.setPrize(wheelEntity,token);
  }
}
