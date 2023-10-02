import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../themes/theme_colors.dart';

class FormColorChangeNotifier with ChangeNotifier {
  Color _pickedColorValue = ThemeColors().m3SysLightOnPrimaryContainer;
  Color get pickedColorValue => _pickedColorValue;

  void setField({
    required int index,
    required List<ContactModel> contactList
  }) {
    _pickedColorValue = contactList[index].profileBorderColor;
  }

  void onColorChanged(
    Color color
  ) {
    _pickedColorValue = color;
    notifyListeners();
  }

  void clearField() {
    _pickedColorValue = ThemeColors().m3SysLightOnPrimaryContainer;
    notifyListeners();
  }
}