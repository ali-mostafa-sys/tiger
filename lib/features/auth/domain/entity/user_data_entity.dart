import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable{
  final String token;

 const TokenEntity({required this.token});



  @override
  // TODO: implement props
  List<Object?> get props => [token];

}

class UserDataEntity extends Equatable{
  final String massage;
  final int statue;
  final TokenEntity? tokenEntity;
  const UserDataEntity({required this.massage,required this.statue,this.tokenEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [massage,statue,tokenEntity];
}




