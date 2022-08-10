import 'package:equatable/equatable.dart';


class RegisterEntity extends Equatable {
final  String firstName;
final  String lastName;
final  String email;
final  String password;
final String phoneNumber;
final  String? invitationCode;
final  String macAddress;

const  RegisterEntity(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.macAddress,
      this.invitationCode});

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        phoneNumber,
        macAddress,
        invitationCode
      ];
}
