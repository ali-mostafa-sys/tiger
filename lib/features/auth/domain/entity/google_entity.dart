import 'package:equatable/equatable.dart';

class GoogleEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;

 const GoogleEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  @override

  List<Object?> get props => [email,firstName,lastName];
}