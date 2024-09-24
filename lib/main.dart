import 'package:flutter/material.dart';
import 'package:project_google_sheet/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.blueGrey,
        cardTheme: const CardTheme(color: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
