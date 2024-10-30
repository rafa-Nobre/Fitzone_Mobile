import 'package:fitzone_app/core/models/personal_model.dart';
import 'package:fitzone_app/core/models/user_model.dart';

class EventModel {
  int id;
  String name;
  PersonalModel assignedPersonal;
  List<UserModel> assignedUser; 
  DateTime date;

  EventModel({
    required this.id,
    required this.name,
    required this.date,
    required this.assignedUser,
    required this.assignedPersonal
  });
}