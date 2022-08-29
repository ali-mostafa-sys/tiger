import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/core/network/network_info.dart';
import 'package:tiger/features/fortune_wheel/data/data_source/wheel_local_datasource.dart';
import 'package:tiger/features/fortune_wheel/data/data_source/wheel_remote_datasource.dart';
import 'package:tiger/features/fortune_wheel/data/models/wheel_model.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tiger/features/fortune_wheel/domain/repositories/wheel_repository.dart';

class WheelRepositoryImp implements WheelRepository {
  final WheelRemoteDataSource wheelRemoteDataSource;
  final WheelLocalDataSource wheelLocalDataSource;
  final NetworkInfo networkInfo;

  WheelRepositoryImp(
      {required this.wheelRemoteDataSource,
      required this.networkInfo,
      required this.wheelLocalDataSource});
  ///////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, List<WheelEntity>>> getWheelData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWheelData = await wheelRemoteDataSource.getWheelData();

        wheelLocalDataSource.cacheWheelData(remoteWheelData);

        return Right(remoteWheelData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWheelData = await wheelLocalDataSource.getLocalWheelData();
        return Right(localWheelData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, Unit>> setPrize(WheelEntity wheelEntity) async {
    final WheelModel wheelModel = WheelModel(ucValue: wheelEntity.ucValue);

    if (await networkInfo.isConnected) {
      try {
        await wheelRemoteDataSource.setPrize(wheelModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {

      return Left(OfflineFailure());

    }
  }

  @override
  Future<Either<Failure, UserInfoEntity>> getUserInfoData(String token) async{
   if(await networkInfo.isConnected){
     try{
     final userDataInfo=  await wheelRemoteDataSource.getUserInfoData(token);

       return  Right(userDataInfo);
     }on ServerException{
       return Left(ServerFailure());
     }
   }else {

     return Left(OfflineFailure());

   }




  }
}
