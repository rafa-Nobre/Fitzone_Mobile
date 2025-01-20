
import 'package:fitzone_app/core/models/event_model.dart';

import 'workout_model.dart';

class UserModel {
  String id;
  String registrationId;
  String name;
  String nickName;
  String email;
  String cpf;
  String password;
  DateTime registrationDate;
  int points;
  List<WorkoutModel> activities;
  List<EventModel> events;

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
    required this.activities,
    required this.events,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registrationId': registrationId,
      'name': name,
      'nickName': nickName,
      'email': email,
      'cpf': cpf,
      'password': password,
      'registrationDate': registrationDate.toIso8601String(),
      'points': points,
      'activities': activities.map((activity) => activity.toJson()).toList(),
      'events': events.map((event) => event.toJson()).toList(),
    };
  }
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      registrationId: json['registrationId'],
      name: json['name'],
      nickName: json['nickName'],
      email: json['email'],
      cpf: json['cpf'],
      password: json['password'],
      registrationDate: DateTime.parse(json['registrationDate']),
      points: json['points'],
      activities: (json['activities'] as List)
          .map((activity) => WorkoutModel.fromJson(activity.id, activity))
          .toList(),
      events: (json['events'] as List)
          .map((event) => EventModel.fromJson(event.id, event))
          .toList(),
    );
  }
}