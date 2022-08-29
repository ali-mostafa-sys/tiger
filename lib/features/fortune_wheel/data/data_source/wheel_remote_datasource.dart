import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/features/fortune_wheel/data/models/user_info_model.dart';
import 'package:tiger/features/fortune_wheel/data/models/wheel_model.dart';
import 'package:http/http.dart' as http;

abstract class WheelRemoteDataSource {
  Future<List<WheelModel>> getWheelData();
  Future<Unit> setPrize(WheelModel wheelModel);
  Future<UserInfoModel>getUserInfoData(String token);
}



class WheelRemoteDataSourceImp implements WheelRemoteDataSource {
  final http.Client client;

  WheelRemoteDataSourceImp({required this.client});

  @override
  //////////////////////////////////////////////////////////////////
  Future<List<WheelModel>> getWheelData() async {
    final response = await client.get(Uri.parse(BASE_URL + ''),
        headers: {'Content_Type': 'application/json'});

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<WheelModel> wheelModels =
          decodedJson.map((e) => WheelModel.fromJson(e)).toList();
      return wheelModels;
    } else {
      throw ServerException();
    }
  }

  ////////////////////////////////////////////////////////////////////
  @override
  Future<Unit> setPrize(WheelModel wheelModel) async {
    final body = wheelModel.toJson();

    // final body = {
    //   'ucValue': wheelModel.ucValue,
    // };

    final response = await client.post(
      Uri.parse(BASE_URL + ''),
      body: body,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserInfoModel> getUserInfoData(String token) async{
   final uri=Uri.http(BASE_URL, '',);

   final response=await client.get(uri,headers: {
     'Authorization':'Bearer $token',

   });
   if(response.statusCode==200){
     final data = jsonDecode(response.body);
     final userInfoData=UserInfoModel.fromJson(data);
     return userInfoData;
   }else{
     throw ServerException();
   }




  }
}
