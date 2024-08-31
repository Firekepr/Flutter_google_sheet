import 'package:flutter/material.dart';
import 'package:project_google_sheet/model/FeedbackForm.dart';
import 'package:project_google_sheet/service/google_sheet_service.dart';
import 'package:project_google_sheet/utils/message_utils.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

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
        title: Text(widget.title),
      ),
      body: Padding(
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

              ElevatedButton(onPressed: onSubmit, child: const Text('Save'))
            ],
          ),
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
            } else {
              MessageUtils.modalError(context, "Error!");
            }
          }
        );
        await sheet.submitForm(feedBack);
    }
  }
}