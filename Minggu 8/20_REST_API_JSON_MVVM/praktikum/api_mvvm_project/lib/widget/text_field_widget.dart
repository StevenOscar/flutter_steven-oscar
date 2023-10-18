import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        label: Text(label),
        labelStyle: const TextStyle(fontSize: 20)
      ),
    );
  }
}
