import 'package:interview_dynamic_layout/Model/WidgetModel.dart';

class AppModel {
  final String theme;
  final List<WidgetModel> widgets;

  AppModel({required this.theme, required this.widgets});

  factory AppModel.fromJson(Map json) {
    var list = json['widgets'] as List;
    List<WidgetModel> widgetsList = <WidgetModel>[
      ...list.map((i) => WidgetModel.fromJson(i)),
    ];

    return AppModel(
      theme: json['app']['theme'],
      widgets: widgetsList,
    );
  }
}