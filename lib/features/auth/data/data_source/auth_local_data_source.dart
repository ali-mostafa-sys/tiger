import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<Unit> getToken(String token, String invitationCode);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> getToken(String token, String invitationCode) async {
    await sharedPreferences.setString('USER_TOKEN', token);
    await sharedPreferences.setString('INVITATION_CODE', invitationCode);
    return Future.value(unit);
  }
}
