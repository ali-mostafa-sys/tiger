import 'package:tiger/features/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity{
const  RegisterModel({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  //  required String phoneNumber,
    required String macAddress,
    String? invitationCode,
}):super(firstName: firstName,
  lastName: lastName,
    email: email,
    password: password,
   // phoneNumber: phoneNumber,
    macAddress: macAddress,
    invitationCode: invitationCode
  );

  factory RegisterModel.fromJson(Map<String,dynamic>json){
    final firstName=json['firstName'];
    final lastName=json['lastName'];
    final email=json['email'];
    final password=json['password'];
   // final phoneNumber=json['phoneNumber'];
    final macAddress=json['macAddress'];
    final invitationCode=json['invitationCode'];
    return RegisterModel(firstName: firstName,
        lastName: lastName, email: email, password: password, macAddress: macAddress,invitationCode: invitationCode);
  }

  Map<String,dynamic> toJson(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'password':password,
     // 'phoneNumber':phoneNumber,
      'macAddress':macAddress,
      'invitationCode':invitationCode,

  };
}
}