import 'package:tiger/features/fortune_wheel/domain/entity/wheel_entity.dart';

class WheelModel extends WheelEntity {
  const WheelModel({required int ucValue}) : super(ucValue: ucValue);

  factory WheelModel.fromJson(Map<String, dynamic> json) {
    return WheelModel(ucValue: json['ucValue']);
  }

  Map<String, dynamic> toJson() {
    return {
      'ucValue': ucValue,
    };
  }
}
