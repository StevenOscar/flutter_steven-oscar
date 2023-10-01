import 'package:flutter/material.dart';

import '../themes/theme_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final String? errorText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.label,
    this.errorText,
    required this.onChanged,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
          color: Colors.black
        )),
        errorText: errorText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.lightBlue
          ),
          borderRadius:BorderRadius.all(Radius.circular(0))
        ),
        hintText: hintText,
        hintStyle: ThemeTextStyles().bodySmallBlack,
        filled: true,
        fillColor: Colors.grey.shade200,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: onChanged,
    );
  }
}
