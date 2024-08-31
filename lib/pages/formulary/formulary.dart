import 'package:flutter/material.dart';

class Formulary extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileNumberController;
  final TextEditingController feedBackController;

  const Formulary({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.nameController,
    required this.emailController,
    required this.mobileNumberController,
    required this.feedBackController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Form(
        key: formKey,
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
}
