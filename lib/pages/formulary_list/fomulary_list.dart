import 'package:flutter/material.dart';
import 'package:project_google_sheet/global.dart';
import 'package:project_google_sheet/model/FeedbackForm.dart';
import 'package:project_google_sheet/pages/formulary_list/components/formulary_list_item.dart';
import 'package:project_google_sheet/pages/formulary_list/components/formulary_list_loader.dart';
import 'package:project_google_sheet/service/google_sheet_service.dart';
import 'package:project_google_sheet/utils/message_utils.dart';

class FormularyList extends StatefulWidget {
  const FormularyList({super.key});

  @override
  State<FormularyList> createState() => _FormularyListState();
}

class _FormularyListState extends State<FormularyList> {
  bool loading = true;
  List<FeedbackForm> forms = [];

  @override
  void initState() {
    _getGoogleSheetsForms(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Global.firstLoad
          ? const FormularyListLoader()
          : RefreshIndicator(
              onRefresh: () =>  _getGoogleSheetsForms(true),
              child: SizedBox(
                height: forms.length < 4 ? MediaQuery.sizeOf(context).height : null,
                child: _getBody(),
              ),
          ),
    );
  }

  Widget _getBody() {
    if (forms.isEmpty) {
      return Center(
        child: Text(
          ':(\nNo feedback yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: forms.length,
        padding: const EdgeInsets.only(top: 4.0),
        itemBuilder: (context, int idx) => FormularyListItem(item: forms[idx], idx: idx),
      );
    }
  }

  Future<void> _getGoogleSheetsForms(bool refresh) async {
    if (mounted) setState(() => forms = Global.feedbacks);
    if (!refresh && !Global.firstLoad) return;

    final sheet = GoogleSheetService((String response) {
      if (response == GoogleSheetService.STATUS_SUCCESS) {
        setState(() {});
      } else {
        // MessageUtils.modalError(context, "Error!");
      }
    });

    forms = await sheet.getDataFromGoogleSheet();
    loading = false;
    Global.firstLoad = false;
    Global.feedbacks = forms;
    if (mounted) setState(() {});
  }
}
