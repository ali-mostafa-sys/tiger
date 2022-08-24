import 'package:tiger/features/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String macAddress,
    required String? invitationCode,
  }) : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            macAddress: macAddress,
            invitationCode: invitationCode);

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final email = json['email'];
    final password = json['password'];
    final macAddress = json['mac_address'];
    final invitationCode = json['reference_code'];
    return RegisterModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        macAddress: macAddress,
        invitationCode: invitationCode);
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'mac_address': macAddress,
      'reference_code': invitationCode,
    };
  }
}
