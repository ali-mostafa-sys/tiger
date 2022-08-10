import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource{
  Future <Unit> getToken(String token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource{
final SharedPreferences sharedPreferences;

AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> getToken(String token)async {
  await sharedPreferences.setString('USER_TOKEN', token);
  return Future.value(unit);
  }

}