import 'package:fitzone_app/core/models/personal_model.dart';

class EventModel {
  int id;
  String name;
  PersonalModel assignedPersonal;
  DateTime date;

  EventModel({
    required this.id,
    required this.name,
    required this.date,
    required this.assignedPersonal
  });
}