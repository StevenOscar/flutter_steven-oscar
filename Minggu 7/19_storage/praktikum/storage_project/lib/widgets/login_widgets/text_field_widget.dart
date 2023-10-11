import 'package:flutter/material.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon prefixIcon;

  const TextFieldLoginWidget({
    super.key,
    required this.hintText,
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        prefixIcon: prefixIcon,
        label: Text(label),
        labelStyle: const TextStyle(fontSize: 20)
      ),
      onChanged: onChanged,
    );
  }
}
