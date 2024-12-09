import 'package:fitzone_app/core/models/set_model';

class ActivityModel {
  int id;
  String name;
  List<SetModel> sets;
  int timesCompleted;
  double maxWeight;

  ActivityModel({
    required this.id,
    required this.name,
    this.sets = const [],
    this.timesCompleted = 0,
    this.maxWeight = 0.0,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      name: json['name'],
      sets:
          (json['sets'] as List).map((set) => SetModel.fromJson(set)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sets': sets.map((set) => set.toJson()).toList(),
    };
  }
}
