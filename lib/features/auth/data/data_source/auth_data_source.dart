import 'dart:convert';

import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/features/auth/data/models/login_model.dart';
import 'package:tiger/features/auth/data/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:tiger/features/auth/data/models/user_data_model.dart';

abstract class AuthDataSource {
  Future<UserDataModel> postRegister(RegisterModel registerModel);

  Future<UserDataModel> postLogin(LoginModel loginModel);
}

const BASE_URL = '';

class AuthDataSourceImpl implements AuthDataSource {
  final http.Client client;

  AuthDataSourceImpl({required this.client});

  @override
  Future<UserDataModel> postLogin(LoginModel loginModel) async {
    final uri = Uri.https(BASE_URL, '');
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
    final uri = Uri.https(BASE_URL, '');
    final response =
        await client.post(uri, body: userDataRegisterModel.toJson());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userDataModel = UserDataModel.fromJson(data);
      return userDataModel;
    } else {
      throw ServerException();
    }
  }
}