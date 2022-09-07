import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/features/fortune_wheel/data/models/notifications_model.dart';
import 'package:tiger/features/fortune_wheel/data/models/user_info_model.dart';
import 'package:tiger/features/fortune_wheel/data/models/wheel_model.dart';
import 'package:http/http.dart' as http;

abstract class WheelRemoteDataSource {
  Future<List<WheelModel>> getWheelData(String token);

  Future<Unit> setPrize(int wheelModel,String token);
  Future<Unit> sendOrder(int wheelModel,String token);

  Future<UserInfoModel> getUserInfoData(String token);
  Future <List<NotificationsModel>> getNotification(String token);
}

class WheelRemoteDataSourceImp implements WheelRemoteDataSource {
  final http.Client client;

  WheelRemoteDataSourceImp({required this.client});

  @override
  //////////////////////////////////////////////////////////////////
  Future<List<WheelModel>> getWheelData(String token) async {
    final uri = Uri.http(
      BASE_URL,
      '/api/user/getWheelData',
    );
    final response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final  decodedJson = json.decode(response.body) ;
      final List data= decodedJson['data'] as List;
      final List<WheelModel> wheelModels =
          data.map((e) => WheelModel.fromJson(e)).toList();
      return wheelModels;
    } else {
      throw ServerException();
    }
  }

  ////////////////////////////////////////////////////////////////////
  @override
  Future<Unit> setPrize(int wheelModel,String token) async {


    final uri = Uri.http(
      BASE_URL,
      '/api/user/addToPointsRoll',
    );

    final response = await client.post(
      uri,
      headers: {'Authorization': 'Bearer $token'},
      body:{
        'number':wheelModel.toString()
      }
    );



    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserInfoModel> getUserInfoData(String token) async {
    final uri = Uri.http(
      BASE_URL,
      '/api/user/getUserInfo',
    );

    final response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final userInfoData = UserInfoModel.fromJson(data);
      return userInfoData;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendOrder(int ucValue, String token)async {
    final uri = Uri.http(
      BASE_URL,
      '/api/user/order',
    );

    final response = await client.post(
        uri,
        headers: {'Authorization': 'Bearer $token'},
        body:{
          'uc_value':ucValue.toString()
        }
    );


    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NotificationsModel>> getNotification(String token)async {
  final uri =Uri.http(BASE_URL, '');
  final response= await client.get(uri);
  if (response.statusCode == 201) {

    final data = jsonDecode(response.body) as List;
    final notificationsModel= data.map((e) => NotificationsModel.fromJson(e)).toList();
    return notificationsModel;
  } else {
    throw ServerException();
  }

  }
}
