import 'package:flutter/material.dart';
import 'package:interview_dynamic_layout/Controller/ApiService.dart';
import 'package:interview_dynamic_layout/Theme/ThemeNotifier.dart';
import 'package:interview_dynamic_layout/WidgetParser/WidgetParser.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService().fetchAppData("https://rbtechlab.in/app.json"),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        Future.microtask(() {
          ThemeNotifier.theme.value = snapshot.data!.theme == "light"
              ? ThemeMode.light
              : ThemeMode.dark;
        });
        return Scaffold(
          body: WidgetParser(appData: snapshot.data!),
        );
      },
    );
  }
}
