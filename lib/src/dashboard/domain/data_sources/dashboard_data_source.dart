
import 'package:rgt_assessment/src/dashboard/domain/models/activity_model.dart';
import 'package:rgt_assessment/src/dashboard/domain/models/measure_model.dart';
import 'package:rgt_assessment/src/dashboard/domain/models/medication_model.dart';
import '../models/dashboard_model.dart';

class DashboardDataSource{

  Future<DashboardModel> fetchDashboardData() async{
    await Future.delayed(const Duration(seconds: 3));

    return DashboardModel(
      medications: [
        MedicationModel(
          title: "ENTRESTO, 100mg",
          occurrence: '2/day',
          medicationTakenAt: {
            'morning': true,
            'evening': true,
          },
        ),
        MedicationModel(
          title: "Spironolactone, 25mg",
          occurrence: '1/day',
          medicationTakenAt: {
            'morning': true,
          },
        ),
        MedicationModel(
          title: "Cough Mixture, 100mg",
          occurrence: '3/day',
          medicationTakenAt: {
            'morning': true,
            'afternoon': true,
            'evening': true,
          },
        ),
      ],
      measures: [
        MeasureModel(
          title: 'B12',
          status: 'Off Track',
          date: 'Feb 15, 2023',
          rate: '173',
          unit: 'pg/ml',
          extra: {
            'icon': 'oura.png',
            'name': 'Zipline',
            'record': 0,
          },
          isTrack: true,
          lastTestResult: '154 pg/ml (90 days ago)'
        ),
        MeasureModel(
          title: 'Avg. Heart Rate',
          status: 'Good',
          date: '1 day ago',
          rate: '92',
          unit: 'BPM',
          extra: {
            'icon': 'oura.png',
            'name': 'Oura',
            'record': 1,
          },
          isTrack: false,
          lastTestResult: '',
        ),
        MeasureModel(
          title: 'Sleep Score',
          status: 'Good',
          date: '1 day ago',
          rate: '89',
          unit: 'BPM',
          extra: {
            'icon': 'oura.png',
            'name': 'Oura',
            'record': 0,
          },
          isTrack: false,
          lastTestResult: '',
        ),
        MeasureModel(
          title: 'Glucose Level',
          status: 'Good',
          date: '2 days ago',
          rate: '92',
          unit: 'BPM',
          extra: {
            'icon': 'oura.png',
            'name': 'Carelink',
            'record': 0,
          },
          isTrack: false,
          lastTestResult: '',
        ),
      ],
      activities: [
        ActivityModel(
          text: 'Future Visits',
          colorCode: '#22D3EE',
          iconName: 'calendar.svg',
          count: 3,
        ),
        ActivityModel(
          text: 'Future Vaccinations',
          colorCode: '#FACC15',
          iconName: 'injections.svg',
          count: 2,
        ),
        ActivityModel(
          text: 'Future Lab Tests',
          colorCode: '#FB7185',
          iconName: 'labs.svg',
          count: 1,
        ),
        ActivityModel(
          text: 'Future Imaging',
          colorCode: '#818CF8',
          iconName: 'labs.svg',
          count: 1,
        ),
        ActivityModel(
          text: 'Surgeries',
          colorCode: '#F472B6',
          iconName: 'building.svg',
          count: 1,
        ),
      ]
    );
  }

}