import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String validator;
  final IconData suffixIcon;
  final EdgeInsets margin;
  final TextInputType inputType;
  final bool Function(String value)? validators;
  final int maxLines;
  final bool readOnly;

  const CustomTextInput({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    required this.suffixIcon,
    this.validators,
    this.inputType = TextInputType.text,
    this.margin = EdgeInsets.zero,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool isPressed = false;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        validator: (value) => (widget.validators != null && widget.validators!(value!) || widget.validators == null && value!.isEmpty) ? widget.validator : null,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        keyboardType: widget.inputType,
        maxLines: widget.maxLines,
        minLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey[300],
          contentPadding: const EdgeInsets.only(left: 12.0),
          label: Text(widget.hint),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          suffixIcon: Icon(widget.suffixIcon, color: Theme.of(context).primaryColor),
          border: InputBorder.none
        ),
      ),
    );
  }

}
