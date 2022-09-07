import 'package:dartz/dartz.dart';
import 'package:tiger/core/errors/failures.dart';
import 'package:tiger/features/fortune_wheel/domain/entity/notifications/notifications_entity.dart';
import 'package:tiger/features/fortune_wheel/domain/repositories/wheel_repository.dart';

class GetNotificationsUseCase{
  final WheelRepository wheelRepository;
  const GetNotificationsUseCase({required this.wheelRepository});
  Future <Either<Failure,List<NotificationsEntity>>>call(String token)async{
    return await wheelRepository.getNotifications(token);
  }
}