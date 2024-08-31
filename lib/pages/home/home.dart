import 'package:flutter/material.dart';
import 'package:project_google_sheet/model/FeedbackForm.dart';
import 'package:project_google_sheet/pages/formulary/formulary.dart';
import 'package:project_google_sheet/service/google_sheet_service.dart';
import 'package:project_google_sheet/utils/message_utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final feedBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter google sheets'),
      ),
      body: Formulary(
        formKey: _formKey,
        emailController: emailController,
        feedBackController: feedBackController,
        mobileNumberController: mobileNumberController,
        nameController: nameController,
        onSubmit: onSubmit,
      ),
    );
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
        final feedBack = FeedbackForm(
          name: nameController.text,
          email: emailController.text,
          mobile_number: mobileNumberController.text,
          feedBack: feedBackController.text,
        );

        final sheet = GoogleSheetService((String response) {
            if (response == GoogleSheetService.STATUS_SUCCESS) {
              MessageUtils.showSnackMessage(context, "Feedbback Submited");
            } else {
              MessageUtils.modalError(context, "Error!");
            }
          }
        );
        await sheet.submitForm(feedBack);
    }
  }
}