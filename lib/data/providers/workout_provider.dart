import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:fitzone_app/core/models/activity_model.dart';
import 'package:fitzone_app/core/models/workout_model.dart';

class WorkoutProvider with ChangeNotifier {
  final _baseUrl = 'https://fitzone-app-d2e07-default-rtdb.firebaseio.com/';
  List<WorkoutModel> _workouts = [];

  List<WorkoutModel> get workouts => _workouts;

  Future<void> fetchWorkouts() async {
  
}
}