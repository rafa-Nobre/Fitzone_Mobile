import 'activity_model.dart';

class UserModel {
  int id;
  String registrationId;
  String name;
  String nickName;
  String email;
  String cpf;
  String password;
  DateTime registrationDate;
  int level;
  List<ActivityModel> activities;

  UserModel({
    required this.id,
    required this.registrationId,
    required this.name,
    required this.nickName,
    required this.email,
    required this.cpf,
    required this.password,
    required this.registrationDate,
    required this.level,
    required this.activities
  });
}