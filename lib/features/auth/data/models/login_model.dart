import 'package:tiger/features/auth/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity{

 const LoginModel({
    required String email,
    required String password,
}):super(password: password,email: email);

  factory LoginModel.fromJson(Map<String,dynamic>json){
    final email=json['email'];
    final password=json['password'];
    return LoginModel(email: email, password: password);
  }
  Map<String,dynamic  > toJson(){
    return {
      'email':email,
      'password':password,
    };
  }
}