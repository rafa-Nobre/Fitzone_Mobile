class ActivityModel {
  int id;
  String name;
  String reps;
  int timesCompleted;
  double maxWeight;
  List<double> progressWeights;
  double averageWeight;

  ActivityModel({
    required this.id,
    required this.name,
    required this.reps,
    this.timesCompleted = 0,
    this.maxWeight = 0.0,
    this.averageWeight = 0.0,
    this.progressWeights = const [],
  });

  // Método fromJson
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      name: json['name'],
      reps: json['reps'],
      timesCompleted: json['timesCompleted'],
      maxWeight: json['maxWeight'].toDouble(),
      averageWeight: json['averageWeight'].toDouble(),
      progressWeights: List<double>.from(json['progressWeights']),
    );
  }

  // Método toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'reps': reps,
      'timesCompleted': timesCompleted,
      'maxWeight': maxWeight,
      'averageWeight': averageWeight,
      'progressWeights': progressWeights,
    };
  }
}
