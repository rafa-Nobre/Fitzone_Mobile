import 'dart:convert';
import 'package:fitzone_app/core/models/workout_model.dart';
import 'package:http/http.dart' as http;

class WorkoutService {
  final _baseUrl = 'https://fitzone-app-d2e07-default-rtdb.firebaseio.com/';

  Future<List<WorkoutModel>> fetchWorkouts() async {
    final response = await http.get(Uri.parse("$_baseUrl/workouts.json"));
    final List<WorkoutModel> loadedWorkouts = [];

    if (response.statusCode == 200) {
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;

      extractedData.forEach((id, data) {
        loadedWorkouts
            .add(WorkoutModel.fromJson(id, data)); 
      });
    } else {
      throw Exception("Erro ao buscar treinos");
    }

    return loadedWorkouts;
  }
}

