import 'package:tiger/features/auth/domain/entity/user_data_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({required String token,required AllUserDataModel user}) : super(token: token,user: user);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    final token = json['token'];
    final userData=json['user'];
    final user=AllUserDataModel.fromJson(userData);
    return TokenModel(token: token,user: user);
  }


}
class AllUserDataModel extends AllDataUserEntity{
  const AllUserDataModel({
    required String firstName,
    required String lastName,
    required String email,
    required String invitationToken,
    required int id,
}):super(firstName: firstName,lastName: lastName,email: email,invitationToken: invitationToken,id: id);
  factory AllUserDataModel.fromJson(Map<String,dynamic>json){
    final firstName=json['first_name'];
    final lastName=json['last_name'];
    final email=json['email'];
    final invitationToken=json['invitation_token'];
    final id=json['id'];
    return AllUserDataModel(firstName: firstName, lastName: lastName, email: email, invitationToken: invitationToken, id: id);
  }

}

class UserDataModel extends UserDataEntity{
 const UserDataModel({
    required String massage,
    required int statue,
    TokenModel? tokenModel,
}):super(message: massage,status: statue,data: tokenModel);
  factory UserDataModel.fromJson(Map<String,dynamic>json){
    final massage=json['message'];
    final statue=json['status'];
    final token=json['data'];
    final tokenModel=TokenModel.fromJson(token);

    return UserDataModel(massage: massage, statue: statue,tokenModel: tokenModel);
  }
}
