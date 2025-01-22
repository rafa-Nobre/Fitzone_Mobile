import 'dart:convert';
import 'package:fitzone_app/core/models/event_model.dart';
import 'package:fitzone_app/core/models/workout_model.dart';
import 'package:fitzone_app/core/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class EventProvider with ChangeNotifier {
  final String _baseUrl =
      'https://fitzone-app-d2e07-default-rtdb.firebaseio.com/';
  List<EventModel> _events = [];


  List<EventModel> get events => [..._events];

  Future<void> fetchEvents() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/events.json'));

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch events');
      }

      final List<dynamic> data = json.decode(response.body) ?? [];
      final List<EventModel> loadedEvents = [];

      for (var eventData in data) {
        final event = EventModel.fromJson(
          eventData,
        );
        loadedEvents.add(event);
      }

      _events = loadedEvents;
      print('Response: ${_events}');
      notifyListeners();
    } catch (error) {
      print('Error fetching events: $error');
      rethrow;
    }
  }
}
