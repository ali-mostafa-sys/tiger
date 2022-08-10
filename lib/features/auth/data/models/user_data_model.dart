import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({required String token}) : super(token: token);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    final token = json['token'];
    return TokenModel(token: token);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

class UserDataModel extends UserDataEntity{
 const UserDataModel({
    required String massage,
    required int statue,
    TokenModel? tokenModel,
}):super(massage: massage,statue: statue,tokenEntity: tokenModel);
  factory UserDataModel.fromJson(Map<String,dynamic>json){
    final massage=json['massage'];
    final statue=json['statue'];
    final token=json['data'];
    final tokenModel=TokenModel.fromJson(token);

    return UserDataModel(massage: massage, statue: statue,tokenModel: tokenModel);
  }
}
