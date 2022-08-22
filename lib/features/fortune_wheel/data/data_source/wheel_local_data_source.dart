import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/errors/exceptions.dart';
import 'package:tiger/features/fortune_wheel/data/models/wheel_model.dart';

abstract class WheelLocalDataSource {
  Future<List<WheelModel>> getLocalWheelData();
  Future<Unit> cacheWheelData(List<WheelModel> wheelModel);
}

const cashedWheelData = 'cached_wheel_data';

class WheelLocalDataSourceImp implements WheelLocalDataSource {
  final SharedPreferences sharedPreferences;

  WheelLocalDataSourceImp({required this.sharedPreferences});
  /////////////////////////////////////////////////////////////////////
  @override
  Future<Unit> cacheWheelData(List<WheelModel> wheelModel) {
    List wheelDataToJson = wheelModel.map((e) => e.toJson()).toList();

    sharedPreferences.setString(cashedWheelData, json.encode(wheelDataToJson));

    return Future.value(unit);
  }

  /////////////////////////////////////////////////////////////////////
  @override
  Future<List<WheelModel>> getLocalWheelData() {
    final jsonString = sharedPreferences.getString(cashedWheelData);

    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);

      List<WheelModel> jsonToWheelModel =
          decodeJsonData.map((e) => WheelModel.fromJson(e)).toList();

      return Future.value(jsonToWheelModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
