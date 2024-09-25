import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_google_sheet/global.dart';
import 'package:project_google_sheet/pages/formulary/formulary.dart';
import 'package:project_google_sheet/pages/formulary_list/fomulary_list.dart';
import 'package:project_google_sheet/pages/home/components/navigator_bar.dart';
import 'package:project_google_sheet/service/google_sheet_service.dart';
import 'package:project_google_sheet/utils/message_utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(initialPage: 0, keepPage: false);
  int _bottomNavIndex = 0;

  @override
  void initState() {
    loadingConsult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Flutter X Google Sheets',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Formulary(reload: () => _getList(true)),
          const FormularyList(),
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

  Future<Timer> loadingConsult() async {
    return Timer.periodic(const Duration(seconds: 30), (timer) async {
      await _getList(false);
    });
  }

  Future<void> _getList(bool reload) async {
    final sheet = GoogleSheetService((String response) {
      if (response == GoogleSheetService.STATUS_SUCCESS) {
        setState(() {});
      } else {
        //MessageUtils.modalError(context, "Error!");
      }
    });

    await sheet.getDataFromGoogleSheet().then((value) => {
      if (Global.firstLoad && reload) Global.firstLoad = false,
      Global.loading = false,
      Global.feedbacks = value,
      setState(() {}),
    });
  }
}