
class ActivityModel{
  final String text;
  final String colorCode;
  final String iconName;
  final int count;

  ActivityModel({
    required this.text,
    required this.colorCode,
    required this.iconName,
    required this.count,
  });


  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      text: json['text'],
      count: json['count'],
      iconName: json['iconName'],
      colorCode: json['colorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'colorCode': colorCode,
      'iconName': iconName,
      'count': count,
    };
  }
}


class ActivityList {
  ActivityList({required this.list});
  final List<ActivityModel> list;

  factory ActivityList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => ActivityModel.fromJson(obj) ).toList();
    return ActivityList(list: list);
  }

}