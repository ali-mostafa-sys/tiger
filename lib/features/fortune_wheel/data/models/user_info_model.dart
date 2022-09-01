import 'package:tiger/features/fortune_wheel/domain/entity/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity {
  const UserInfoModel({
    required String firstName,
    required String lastName,
    required String email,
    required int points,
    required int numberOfRolls,
  }) : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            points: points,
            numberOfRolls: numberOfRolls);

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final email = json['email'];
    final points = json['points'];
    final numberOfRolls = json['remain_roll'];
    return UserInfoModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        points: points,
        numberOfRolls: numberOfRolls);
  }
}
