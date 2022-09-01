import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';

import 'package:tiger/features/fortune_wheel/domain/repositories/wheel_repository.dart';

class SendOrderUseCase {
  final WheelRepository wheelRepository;

  SendOrderUseCase(this.wheelRepository);

  Future<Either<Failure, Unit>> call( int ucValue, String token) async {
    return await wheelRepository.sendOrder(ucValue,token);
  }
}