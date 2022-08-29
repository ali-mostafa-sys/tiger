import 'package:equatable/equatable.dart';

class  UserInfoEntity extends Equatable{
  final String firstName;
  final String lastName;
  final String email;
  final int points;
  final int numberOfRolls;
  const UserInfoEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.points,
    required this.numberOfRolls,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,email,points,numberOfRolls];

}