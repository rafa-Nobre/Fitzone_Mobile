
import 'activity_model.dart';

enum DifficultyLevel { beginner, intermediate, advanced }

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
  int id;
  List<String> muscleGroups;
  DayOfWeek dayOfWeek;
  DifficultyLevel difficulty;
  int estimatedTime;
  List<ActivityModel> activities;
  String notes;

  WorkoutModel({
    required this.id,
    required this.muscleGroups,
    required this.dayOfWeek,
    required this.difficulty,
    required this.estimatedTime,
    required this.activities,
    this.notes = '',
  });

  // Método fromJson
  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
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
      'muscleGroups': muscleGroups,
      'dayOfWeek': dayOfWeek.index,
      'difficulty': difficulty.index,
      'estimatedTime': estimatedTime,
      'activities': activities.map((activity) => activity.toJson()).toList(),
      'notes': notes,
    };
  }
}
