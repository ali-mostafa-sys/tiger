import 'package:tiger/features/fortune_wheel/domain/entity/notifications/notifications_entity.dart';

class NotificationsModel extends NotificationsEntity{
const  NotificationsModel({
    final String? notification
}):super(notifications:notification );

factory NotificationsModel.fromJson(Map<String,dynamic>json){
  final notifications=json['not'];
  return NotificationsModel(notification:notifications );
}

}