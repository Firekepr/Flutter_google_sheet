import 'package:flutter/material.dart';
import 'package:project_google_sheet/pages/formulary/formulary.dart';
import 'package:project_google_sheet/pages/home/components/navigator_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter google sheets'),
      ),
      body: const Formulary(),
      bottomNavigationBar: NavigatorBar(
        bottomNavIndex: _bottomNavIndex,
        onTap: (idx) => setState(() => _bottomNavIndex = idx),
      ),
    );
  }
}