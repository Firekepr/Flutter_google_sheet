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
       final response = await http.get(Uri.parse('$URL${feedback.toParams()}&action=save'));

       callBack(jsonDecode(response.body)['status']);
     } catch (e) {
       print(e);
     }
  }

  Future<List<FeedbackForm>> getDataFromGoogleSheet() async {
    List<FeedbackForm> response = [];

    final request = await http.get(Uri.parse('$URL?action=get'));

    callBack(jsonDecode(request.body)['status']);

    if (jsonDecode(request.body)['status'] != STATUS_SUCCESS) return response;

    List<dynamic> mapItems = jsonDecode(request.body)['data'];

    for (int i = 1; i < mapItems.length; i++) {
      response.add(FeedbackForm.fromMap(mapItems[i]));
    }

    return response;
  }
}