class ChildModel {
  final String? icon;
  final String company_name;
  final String current;
  final String prev_close;

  ChildModel({this.icon, required this.company_name, required this.current, required this.prev_close});

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      icon: json['icon'],
      company_name: json['company_name'],
      current: json['current'],
      prev_close: json['prev_close'],
    );
  }
}
