import 'package:equatable/equatable.dart';

class WheelEntity extends Equatable{
  final int ucValue;

  const WheelEntity({required this.ucValue});

  @override
  
  List<Object?> get props => [ucValue];

}