


import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/auth/domain/entity/google_entity.dart';


import '../repositories/auth_repository.dart';

class GoogleUseCase{
  final AuthRepository authRepository;
  GoogleUseCase(this.authRepository);
  Future<Either<Failure,GoogleEntity>>call()async{
    return await authRepository.getGoogleEmail();
  }
}