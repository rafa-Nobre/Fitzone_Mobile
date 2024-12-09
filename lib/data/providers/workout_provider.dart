import 'dart:convert';
import 'package:fitzone_app/core/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class WorkoutProvider with ChangeNotifier {
  final String _baseUrl =
      'https://fitzone-app-d2e07-default-rtdb.firebaseio.com/';
  List<WorkoutModel> _workouts = [];

WorkoutModel? get todaysWorkout {
    final now = DateTime.now();

    final todayEnum =
        DayOfWeek.values[now.weekday % 7 == 0 ? 6 : now.weekday - 1];



    return _workouts.firstWhere(
      (workout) => workout.dayOfWeek == todayEnum
    );
  }

  List<WorkoutModel> get workouts => [..._workouts];

  Future<void> fetchWorkouts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/workouts.json'));

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch workouts');
      }

      final Map<String, dynamic> data = json.decode(response.body) ?? {};
      final List<WorkoutModel> loadedWorkouts = [];

      data.forEach((workoutId, workoutData) {
        final workout = WorkoutModel.fromJson(
          workoutId,
          workoutData,
        );
        loadedWorkouts.add(workout);
      });

      _workouts = loadedWorkouts;
      notifyListeners();
    } catch (error) {
      print('Error fetching workouts: $error');
      rethrow;
    }
  }
}
