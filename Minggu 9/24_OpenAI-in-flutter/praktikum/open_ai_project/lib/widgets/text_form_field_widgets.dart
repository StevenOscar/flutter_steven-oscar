import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;


  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color(0xFFE7E0EC),
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xFF21005D)
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle : const TextStyle(
          color: Colors.black
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF21005D)
          )
        ),
      ),
      validator: (String? value) {
        bool isInvalid = value == null || value.isEmpty || int.tryParse(value) == null;
        if (isInvalid) {
          return 'Please enter valid numbers';
        }
        return null;
      },
    );
  }
}