import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/auth/domain/entity/google_entity.dart';
import 'package:tiger/features/auth/domain/entity/login_entity.dart';
import 'package:tiger/features/auth/domain/entity/register_entity.dart';
import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserDataEntity>> postRegister(
      RegisterEntity registerEntity);

  Future<Either<Failure, UserDataEntity>> postLogin(LoginEntity loginEntity);

  Future<Either<Failure, GoogleEntity>> getGoogleEmail();
}
