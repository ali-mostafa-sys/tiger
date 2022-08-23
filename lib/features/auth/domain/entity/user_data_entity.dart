import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable{
  final String token;
  final AllDataUserEntity user;

 const TokenEntity({required this.token,required this.user});



  @override
  // TODO: implement props
  List<Object?> get props => [token,user];

}

class AllDataUserEntity extends Equatable{
final String firstName;
final String lastName;
final String email;
final String invitationToken;
final int id;

// final int points;
// final int rollCount;
const AllDataUserEntity({
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.invitationToken,
  required this.id,
  // required this.points,
  // required this.rollCount,
});

  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,email,invitationToken,id];

}

class UserDataEntity extends Equatable{
  final String message;
  final int status;
  final TokenEntity? data;
  const UserDataEntity({required this.message,required this.status,this.data});
  @override
  // TODO: implement props
  List<Object?> get props => [message,status,data];
}




