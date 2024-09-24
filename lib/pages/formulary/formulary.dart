import 'package:flutter/material.dart';
import 'package:project_google_sheet/model/FeedbackForm.dart';
import 'package:project_google_sheet/service/google_sheet_service.dart';
import 'package:project_google_sheet/shared/custom_text_input.dart';
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
  
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            CustomTextInput(
              readOnly: loading,
              controller: nameController,
              hint: 'Name',
              validator: 'Enter valid Name',
              suffixIcon: Icons.person,
            ),

            CustomTextInput(
              readOnly: loading,
              controller: emailController,
              hint: 'E-mail',
              validator: 'Enter valid e-mail',
              suffixIcon: Icons.email,
              inputType: TextInputType.emailAddress,
              validators: (value) => !value.contains('@'),
              margin: const EdgeInsets.only(top: 8.0),
            ),

            CustomTextInput(
              readOnly: loading,
              controller: mobileNumberController,
              hint: 'Mobile number',
              validator: 'Enter valid number',
              suffixIcon: Icons.phone_iphone_rounded,
              inputType: TextInputType.number,
              margin: const EdgeInsets.only(top: 8.0),
            ),

            CustomTextInput(
              readOnly: loading,
              controller: feedBackController,
              hint: 'Feedback',
              validator: 'Enter valid Feedback',
              suffixIcon: Icons.chat,
              margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            ),

            Opacity(
              opacity: loading ? 0.5 : 1,
              child: ElevatedButton(
                onPressed: loading ? null : onSubmit,
                child: Text('Send', style: TextStyle(color: Colors.indigo[800])),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);

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
      setState(() => loading = false);
    }
  }
}
