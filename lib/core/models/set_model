class SetModel {
  String type; // W, 1, 2, F
  int reps; 
  double weight; 
  bool toFailure; 

  SetModel({
    required this.type,
    required this.reps,
    required this.weight,
    this.toFailure = false,
  });

  factory SetModel.fromJson(Map<String, dynamic> json) {
    return SetModel(
      type: json['type'],
      reps: json['reps'],
      weight: json['weight'],
      toFailure: json['toFailure'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'reps': reps,
      'weight': weight,
      'toFailure': toFailure,
    };
  }
}
