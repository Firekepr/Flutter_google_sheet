import 'package:flutter/material.dart';
import 'package:project_google_sheet/model/FeedbackForm.dart';
import 'package:project_google_sheet/service/google_sheet_service.dart';
import 'package:project_google_sheet/utils/message_utils.dart';

class Formulary extends StatefulWidget {
  const Formulary({super.key});

  @override
  State<Formulary> createState() => _FormularyState();
}

class _FormularyState extends State<Formulary> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final feedBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              validator: (value) {
                return value!.isEmpty ? 'Enter Valid Name' : null;
              },
              decoration: const InputDecoration(
                hintText: 'name',
              ),
            ),
            TextFormField(
              controller: emailController,
              validator: (value) {
                return value!.isEmpty ? 'Enter Valid email' : null;
              },
              decoration: const InputDecoration(
                hintText: 'email',
              ),
            ),
            TextFormField(
              controller: mobileNumberController,
              validator: (value) {
                return value!.isEmpty ? 'Enter Valid Number' : null;
              },
              decoration: const InputDecoration(
                hintText: 'Mobile number',
              ),
            ),
            TextFormField(
              controller: feedBackController,
              validator: (value) {
                return value!.isEmpty ? 'Enter Valid Feedback' : null;
              },
              decoration: const InputDecoration(
                hintText: 'Feedback',
              ),
            ),

            ElevatedButton(onPressed: onSubmit, child: const Text('Save')),
          ],
        ),
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
          nameController.text = '';
          emailController.text = '';
          mobileNumberController.text = '';
          feedBackController.text = '';
          setState(() {});

        } else {
          MessageUtils.modalError(context, "Error!");
        }
      });

      await sheet.submitForm(feedBack);
    }
  }
}
