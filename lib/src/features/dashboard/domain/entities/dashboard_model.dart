
import 'activity_model.dart';
import 'measure_model.dart';
import 'medication_model.dart';

class DashboardModel{
  final List<MedicationModel> medications;
  final List<MeasureModel> measures;
  final List<ActivityModel> activities;

  DashboardModel({
    required this.medications,
    required this.measures,
    required this.activities,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      medications: MedicationList.fromJson(json['medications']).list,
      measures: MeasureList.fromJson(json['measures']).list,
      activities: ActivityList.fromJson(json['activities']).list,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medications': medications.map((obj) => obj.toJson()).toList(),
      'measures': measures.map((obj) => obj.toJson()).toList(),
      'activities': activities.map((obj) => obj.toJson()).toList(),
    };
  }


}