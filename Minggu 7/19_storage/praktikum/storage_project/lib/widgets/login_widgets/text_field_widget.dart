import 'package:flutter/material.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon prefixIcon;
  final bool isShowPasswordIcon;

  const TextFieldLoginWidget({
    super.key,
    required this.hintText,
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.prefixIcon,
    this.isShowPasswordIcon = false
  });

  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          keyboardType: keyboardType,
          obscureText: obscureText ? !isPasswordVisible : false,
          decoration: InputDecoration(
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: isShowPasswordIcon ?
              IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: isPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
              ) : null,
            label: Text(label),
            labelStyle: const TextStyle(fontSize: 20)
          ),
          onChanged: onChanged,
        );
      },
    );
  }
}
