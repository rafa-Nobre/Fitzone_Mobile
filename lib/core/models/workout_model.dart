
import 'activity_model.dart';

enum DifficultyLevel { iniciante, intermediario, avancado }

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class WorkoutModel {
  String id;
  String name;
  List<String> muscleGroups;
  DayOfWeek dayOfWeek;
  DifficultyLevel difficulty;
  int estimatedTime;
  List<ActivityModel> activities;
  String notes;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.muscleGroups,
    required this.dayOfWeek,
    required this.difficulty,
    required this.estimatedTime,
    required this.activities,
    this.notes = '',
  });

  // Método fromJson
  factory WorkoutModel.fromJson(String id, Map<String, dynamic> json) {
    return WorkoutModel(
      id: id,
      name: json['name'],
      muscleGroups: List<String>.from(json['muscleGroups']),
      dayOfWeek: DayOfWeek.values[json['dayOfWeek']],
      difficulty: DifficultyLevel.values[json['difficulty']],
      estimatedTime: json['estimatedTime'],
      activities: (json['activities'] as List)
          .map((activity) => ActivityModel.fromJson(activity))
          .toList(),
      notes: json['notes'] ?? '',
    );
  }

  // Método toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'muscleGroups': muscleGroups,
      'dayOfWeek': dayOfWeek.index,
      'difficulty': difficulty.index,
      'estimatedTime': estimatedTime,
      'activities': activities.map((activity) => activity.toJson()).toList(),
      'notes': notes,
    };
  }
}
