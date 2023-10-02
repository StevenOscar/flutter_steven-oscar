import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class FormDateChangeNotifier with ChangeNotifier {
  DateTime _pickedDateValue = DateTime.now();
  DateTime get pickedDateValue => _pickedDateValue;

  void setField({
    required int index,
    required List<ContactModel> contactList
  }) {
    _pickedDateValue = contactList[index].birthDate;
  }


  void onDateSelected(
    DateTime? dateSelector
  ){
    if(dateSelector == null){
      _pickedDateValue = _pickedDateValue;
    } else {
      _pickedDateValue = dateSelector;
    }
    notifyListeners();
  }

  void clearField(){
    _pickedDateValue = DateTime.now();
    notifyListeners();
  }
}