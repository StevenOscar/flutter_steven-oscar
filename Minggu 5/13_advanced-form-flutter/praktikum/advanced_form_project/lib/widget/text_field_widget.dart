import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import '../theme/theme_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final String? errorText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.label,
    this.errorText,
    required this.onChanged,
    required this.controller,
    this.keyboardType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: errorText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ThemeColors().m3SysLightPrimary
          )
        ),
        hintText: hintText,
        hintStyle: ThemeTextStyles().m3BodyLargeTextField,
        filled: true,
        fillColor: ThemeColors().m3SysLightSurfaceVariant,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          label,
        ),
        labelStyle: ThemeTextStyles().m3BodySmall
      ),
      onChanged: onChanged,
    );
  }
}
