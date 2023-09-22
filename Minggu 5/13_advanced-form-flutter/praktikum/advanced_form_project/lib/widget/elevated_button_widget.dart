import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import '../theme/theme_text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Size fixedSize;
  final OutlinedBorder shape;
  final void Function()? onPressed;


  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.fixedSize,
    required this.shape,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: fixedSize,
        backgroundColor: ThemeColors().m3SysLightPrimary,
        shape: shape
      ),
      onPressed: onPressed,
      child: Text(text,
        maxLines: 2,
        style: ThemeTextStyles().m3LabelLarge
      )
    );
  }
}