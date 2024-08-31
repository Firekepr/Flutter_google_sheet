import 'package:flutter/material.dart';
import 'package:project_google_sheet/pages/formulary/formulary.dart';
import 'package:project_google_sheet/pages/formulary_list/fomulary_list.dart';
import 'package:project_google_sheet/pages/home/components/navigator_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(initialPage: 0, keepPage: false);
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter google sheets'),
      ),
      body: PageView(
        controller: controller,
        children: const [
          Formulary(),
          FormularyList(),
        ],
      ),
      bottomNavigationBar: NavigatorBar(
        bottomNavIndex: _bottomNavIndex,
        onTap: _navigate,
      ),
    );
  }

  void _navigate(int idx) {
    if (idx == controller.page) return;

    if (idx > 0) {
      controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
    } else {
      controller.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }

    _bottomNavIndex = idx;

    setState(() {});
  }
}