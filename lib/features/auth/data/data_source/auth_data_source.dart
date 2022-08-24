import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/features/auth/data/models/google_model.dart';
import 'package:tiger/features/auth/data/models/login_model.dart';
import 'package:tiger/features/auth/data/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:tiger/features/auth/data/models/user_data_model.dart';

abstract class AuthDataSource {
  Future<UserDataModel> postRegister(RegisterModel registerModel);

  Future<UserDataModel> postLogin(LoginModel loginModel);
  Future<GoogleModel> getGoogleEmail();
}

const BASE_URL = '192.168.1.3:8000';

class AuthDataSourceImpl implements AuthDataSource {
  final http.Client client;

  AuthDataSourceImpl({required this.client});

  @override
  Future<UserDataModel> postLogin(LoginModel loginModel) async {
    final uri = Uri.http(BASE_URL, '/api/unauth/user/userLogin');
    final response = await client.post(uri, body: loginModel.toJson());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userDataModel = UserDataModel.fromJson(data);
      return userDataModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserDataModel> postRegister(
      RegisterModel userDataRegisterModel) async {
    final uri = Uri.http(BASE_URL, '/api/unauth/user/register');
    final response =
        await client.post(uri, body: userDataRegisterModel.toJson());
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userDataModel = UserDataModel.fromJson(data);
      return userDataModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GoogleModel> getGoogleEmail() async {
    final GoogleModel? googleModel;
    final googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser;

    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('no google user');
    }
    googleModel = GoogleModel(
      email: googleUser.email.toString(),
      firstName: googleUser.displayName!.split(' ')[0].toString(),
      lastName: googleUser.displayName!.split(' ')[1].toString(),
    );
    return googleModel;
  }
}
