class FinishedWorkoutModel {
  int activityId;
  DateTime date;

  FinishedWorkoutModel({
    required this.activityId,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'activityId': activityId,
      'date': date.toIso8601String(),
    };
  }

  factory FinishedWorkoutModel.fromJson(Map<String, dynamic> json) {
    return FinishedWorkoutModel(
      activityId: json['activityId'],
      date: DateTime.parse(json['date']),
    );
  }
}
