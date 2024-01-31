

class MeasureModel{
  final String title;
  final String status;
  final String date;
  final String rate;
  final String unit;
  final Map<String, dynamic> extra;
  final bool isTrack;
  final String lastTestResult;

  MeasureModel({
    required this.title,
    required this.status,
    required this.date,
    required this.rate,
    required this.unit,
    required this.extra,
    required this.isTrack,
    required this.lastTestResult,
  });


  factory MeasureModel.fromJson(Map<String, dynamic> json) {
    return MeasureModel(
      title: json['title'],
      status: json['status'],
      date: json['date'],
      rate: json['rate'],
      unit: json['unit'],
      extra: json['extra'],
      isTrack: json['isTrack'],
      lastTestResult: json['lastTestResult'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'date': date,
      'rate': rate,
      'unit': unit,
      'extra': extra,
      'isTrack': isTrack,
      'lastTestResult': lastTestResult,
    };
  }

}


class MeasureList {
  MeasureList({required this.list});
  final List<MeasureModel> list;

  factory MeasureList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => MeasureModel.fromJson(obj) ).toList();
    return MeasureList(list: list);
  }

}