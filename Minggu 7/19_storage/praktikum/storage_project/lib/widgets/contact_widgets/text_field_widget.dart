import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';
import '../../themes/theme_text_style.dart';

class TextFieldContactWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final String? errorText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextFieldContactWidget({
    super.key,
    required this.hintText,
    required this.label,
    required this.errorText,
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
        errorStyle: const TextStyle(height: 1, fontSize: 13),
        errorMaxLines: 2,
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
