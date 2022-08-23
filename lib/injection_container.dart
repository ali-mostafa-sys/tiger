


import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/network/network_info.dart';
import 'package:tiger/features/auth/data/data_source/auth_data_source.dart';
import 'package:tiger/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:tiger/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tiger/features/auth/domain/repositories/auth_repository.dart';
import 'package:tiger/features/auth/domain/use_case/google_use_case.dart';
import 'package:tiger/features/auth/domain/use_case/login_use_case.dart';
import 'package:tiger/features/auth/domain/use_case/register_use_case.dart';
import 'package:tiger/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/fortune_wheel/data/data_source/wheel_local_datasource.dart';
import 'features/fortune_wheel/data/data_source/wheel_remote_datasource.dart';
import 'features/fortune_wheel/data/repositories/wheel_repository_imp.dart';
import 'features/fortune_wheel/domain/repositories/wheel_repository.dart';
import 'features/fortune_wheel/domain/use_case/get_wheel_data_usecase.dart';
import 'features/fortune_wheel/domain/use_case/set_prize_usecase.dart';
import 'features/fortune_wheel/presentation/bloc/ads_and_rate/ads_and_rate_bloc.dart';
import 'features/fortune_wheel/presentation/bloc/wheel/wheel_bloc.dart';

final sl=GetIt.instance;

Future<void>init()async{
/// features
  /// 1. authentication
   // bloc
    sl.registerFactory(() => LoginBloc(loginUseCase: sl(),sharedPreferences: sl(), googleUseCase: sl()));
    sl.registerFactory(() => RegisterBloc(registerUseCase: sl(), sharedPreferences: sl(), googleUseCase: sl()));
    // useCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => GoogleUseCase(sl()));
    // repository
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authDataSource: sl(), networkInfo: sl(), authLocalDataSource: sl()));
    // dataSource
    sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(client: sl()));
    sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sharedPreferences: sl()));



  //2.Wheel feature

  //bloc
  sl.registerFactory(() => WheelBlocBloc(getWheelDataUseCase: sl()));
  sl.registerFactory(() => AdsAndRateBloc());
  // useCase
  sl.registerLazySingleton(() => GetWheelDataUseCase(sl()));
  sl.registerLazySingleton(() => SetPrizeUseCase(sl()));
  // repository
  sl.registerLazySingleton<WheelRepository>(() => WheelRepositoryImp(
      wheelRemoteDataSource: sl(),
      networkInfo: sl(),
      wheelLocalDataSource: sl()));

  // dataSource

  sl.registerLazySingleton<WheelRemoteDataSource>(
      () => WheelRemoteDataSourceImp(client: sl()));

  sl.registerLazySingleton<WheelLocalDataSource>(
      () => WheelLocalDataSourceImp(sharedPreferences: sl()));


/// core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

/// External
    final sharedPreferences =await SharedPreferences.getInstance();
    sl.registerLazySingleton(() =>sharedPreferences );
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => InternetConnectionChecker());

}