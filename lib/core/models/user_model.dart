
import 'workout_model.dart';

class UserModel {
  int id;
  String registrationId;
  String name;
  String nickName;
  String email;
  String cpf;
  String password;
  DateTime registrationDate;
  int points;
  List<WorkoutModel> activities;

  UserModel({
    required this.id,
    required this.registrationId,
    required this.name,
    required this.nickName,
    required this.email,
    required this.cpf,
    required this.password,
    required this.registrationDate,
    required this.points,
    required this.activities
  });
}