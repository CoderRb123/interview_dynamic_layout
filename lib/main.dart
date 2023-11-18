import 'package:flutter/material.dart';
import 'package:interview_dynamic_layout/Screen/home_page.dart';
import 'package:interview_dynamic_layout/Theme/ThemeNotifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeNotifier.theme,
      builder: (context, value, child) {
        return MaterialApp(
          home: const HomePage(),
          themeMode: value,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            cardColor: Colors.grey.withOpacity(0.2),
            cardTheme: const CardTheme(
                elevation: 0
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black),
              titleMedium: TextStyle(color: Colors.black),
            ),
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            cardColor: Colors.grey.withOpacity(0.2),
            cardTheme: const CardTheme(
              elevation: 0
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
              titleMedium: TextStyle(color: Colors.white),
            ),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
