import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import '../theme/theme_text_style.dart';


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
            "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
            style: ThemeTextStyles().m3BodyMedium,
          )
        ),
      ],
    );
  }
}