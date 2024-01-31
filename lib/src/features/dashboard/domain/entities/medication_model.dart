

class MedicationModel{
  final String title;
  final String occurrence;
  final Map<String, dynamic> medicationTakenAt;

  MedicationModel({
    required this.title,
    required this.occurrence,
    required this.medicationTakenAt,
  });


  factory MedicationModel.fromJson(Map<String, dynamic> json) {
    return MedicationModel(
      title: json['title'],
      occurrence: json['occurrence'],
      medicationTakenAt: json['medicationTakenAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'occurrence': occurrence,
      'medicationTakenAt': medicationTakenAt,
    };
  }

}


class MedicationList {
  MedicationList({required this.list});
  final List<MedicationModel> list;

  factory MedicationList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => MedicationModel.fromJson(obj) ).toList();
    return MedicationList(list: list);
  }

}