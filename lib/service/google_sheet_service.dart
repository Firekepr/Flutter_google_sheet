import 'dart:convert';

import 'package:project_google_sheet/model/FeedbackForm.dart';
import 'package:http/http.dart' as http;

class GoogleSheetService {
  static const String URL = 'YOUR_GOOGLE_SHEET_LINK_HERE';
  static const STATUS_SUCCESS = 'SUCCESS';

  final void Function(String) callBack;

  GoogleSheetService(this.callBack);

  Future<void> submitForm(FeedbackForm feedback) async {
     try {
       final response = await http.get(Uri.parse(URL + feedback.toParams()));

       callBack(jsonDecode(response.body)['status']);
     } catch (e) {
       print(e);
     }
  }
}