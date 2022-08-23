import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/core/network/network_info.dart';
import 'package:tiger/features/auth/data/data_source/auth_data_source.dart';
import 'package:tiger/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:tiger/features/auth/data/models/login_model.dart';
import 'package:tiger/features/auth/data/models/register_model.dart';
import 'package:tiger/features/auth/data/models/user_data_model.dart';
import 'package:tiger/features/auth/domain/entity/google_entity.dart';
import 'package:tiger/features/auth/domain/entity/login_entity.dart';
import 'package:tiger/features/auth/domain/entity/register_entity.dart';
import 'package:tiger/features/auth/domain/repositories/auth_repository.dart';


typedef Future<UserDataModel> LoginOrRegister();

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.authDataSource, required this.networkInfo,required this.authLocalDataSource});

  @override
  Future<Either<Failure, UserDataModel>> postLogin(
      LoginEntity loginEntity) async {
    final loginModel =
        LoginModel(email: loginEntity.email, password: loginEntity.password);
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await authDataSource.postLogin(loginModel);
        await authLocalDataSource.getToken(authResponse.data!.token.toString());
        return Right(authResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> postRegister(
      RegisterEntity registerEntity) async {
    final registerModel = RegisterModel(
        firstName: registerEntity.firstName,
        lastName: registerEntity.lastName,
        email: registerEntity.email,
        password: registerEntity.password,
        macAddress: registerEntity.macAddress);
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await authDataSource.postRegister(registerModel);
        await authLocalDataSource.getToken(authResponse.data!.token.toString());
        return Right(authResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }


  }

  @override
  Future<Either<Failure, GoogleEntity>> getGoogleEmail() async{
   if(await networkInfo.isConnected){
     try{
       final response=await authDataSource.getGoogleEmail();
       return Right(response);

     }on ServerException{
       return left(ServerFailure());
     }
   }else{
     return Left(OfflineFailure());
   }
  }


}
