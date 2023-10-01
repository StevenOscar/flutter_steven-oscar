  import 'package:flutter/material.dart';
  import 'package:project/themes/theme_text_style.dart';

  Future<void> submittedDataDialog({
    required BuildContext context,
    required String firstNameValue,
    required String lastNameValue,
    required String emailValue,
    required String messageValue,
    }) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
          setState(() {});
            return AlertDialog(
              title: Center(
                child: Text(
                  "Submit Success",
                  style: ThemeTextStyles().headlineMediumBlack,
                )
              ),
              content: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "First Name",
                        style: ThemeTextStyles().bodyMediumNormalBlack,
                      ),
                      Text(
                        firstNameValue,
                        style: ThemeTextStyles().bodySmallBlack,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Last Name",
                        style: ThemeTextStyles().bodyMediumNormalBlack,
                      ),
                      Text(
                        lastNameValue,
                        style: ThemeTextStyles().bodySmallBlack,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Email",
                        style: ThemeTextStyles().bodyMediumNormalBlack,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        emailValue,
                        style: ThemeTextStyles().bodySmallBlack,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Message",
                        style: ThemeTextStyles().bodyMediumNormalBlack,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        messageValue,
                        style: ThemeTextStyles().bodySmallBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style : ThemeTextStyles().bodySmallBlack
                  ),
                ),
              ],
            );
          }
        );
      },
    );
  }