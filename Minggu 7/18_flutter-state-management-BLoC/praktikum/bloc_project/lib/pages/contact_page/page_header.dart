import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';
import '../../themes/theme_text_style.dart';


class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.phone_android_rounded,
          color: ThemeColors().m3SysLightSecondary,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal : 24,
            vertical: 16
          ),
          child: Text(
            "Create New Contacts",
            style: ThemeTextStyles().m3HeadlineSmall,
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal : 24
          ),
          child: Text(
            "Contacts with a Twist : \nPersonalize, Customize, Connect!",
            style: ThemeTextStyles().m3BodyLargeTextField,
            textAlign: TextAlign.center,
          )
        ),
      ],
    );
  }
}