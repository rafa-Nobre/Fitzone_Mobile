import 'activity_model.dart';

class PersonalModel {
  int id;
  String name;
  String registrationId;
  List<ActivityModel> assignedActivities;

  PersonalModel({
    required this.id,
    required this.name,
    required this.registrationId,
    required this.assignedActivities
  });
}