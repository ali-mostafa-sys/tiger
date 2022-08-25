import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/auth/domain/entity/login_entity.dart';
import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';
import 'package:tiger/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failure, UserDataEntity>> call(LoginEntity loginEntity) async {
    return await authRepository.postLogin(loginEntity);
  }
}
