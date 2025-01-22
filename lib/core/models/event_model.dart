import 'package:fitzone_app/core/models/personal_model.dart';
import 'package:fitzone_app/core/models/user_model.dart';

class EventModel {
  String id;
  String name;
  String description;
  int durationMinutes;
  String assignedPersonal;
  DateTime date;
  String category;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.durationMinutes,
    required this.date,
    required this.assignedPersonal,
    required this.category
  });

  // Método fromJson
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      durationMinutes: json['durationMinutes'],
      date: DateTime.parse(json['date']),
      assignedPersonal: json['assignedPersonal'],
      category: json['category'],
    );
  }

  // Método toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'durationMinutes': durationMinutes,
      'date': date,
      'assignedPersonal': assignedPersonal,
      'category': category,
    };
  }
}