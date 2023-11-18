import 'package:interview_dynamic_layout/Model/ChildModel.dart';

class WidgetModel {
  final String type;
  final String? message;
  final String? icon;
  final String title;
  final List<ChildModel> children;

  WidgetModel({
    required this.type,
    required this.children,
    required this.title,
    this.message,
    this.icon,
  });

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    var list = (json['children'] ?? []) as List;
    List<ChildModel> childrenList = [];
    if (list.isNotEmpty) {
      childrenList = list.map((i) => ChildModel.fromJson(i)).toList();
    }

    return WidgetModel(
        type: json['type'],
        title: json['title'],
        children: childrenList ?? [],
        message: json['message'],
        icon: json['icon']
    );
  }
}
