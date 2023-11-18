import 'package:interview_dynamic_layout/WidgetParser/WidgetParserEnums.dart';

extension WidgetParserExtensions on String {
  OnlineJsonEnum mapParentStringToWidgetParser() {
    switch (this) {
      case "app":
        return OnlineJsonEnum.app;
      case "widget":
        return OnlineJsonEnum.widget;
      default:
        return OnlineJsonEnum.none;
    }
  }

  OnlineWidgetEnum mapWidgetStringToWidgetParser() {
    switch (this) {
      case "horizontal_list":
        return OnlineWidgetEnum.list;
      case "grid":
        return OnlineWidgetEnum.grid;
      case "alert":
        return OnlineWidgetEnum.alert;
      default:
        return OnlineWidgetEnum.none;
    }
  }
}
