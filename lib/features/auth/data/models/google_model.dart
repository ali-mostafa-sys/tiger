import 'package:tiger/features/auth/domain/entity/google_entity.dart';

class GoogleModel extends GoogleEntity {
  const GoogleModel(
      {required String email,
      required String firstName,
      required String lastName})
      : super(email: email, firstName: firstName, lastName: lastName);


}
