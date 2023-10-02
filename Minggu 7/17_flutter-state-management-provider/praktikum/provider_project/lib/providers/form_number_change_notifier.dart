import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class FormNumberChangeNotifier with ChangeNotifier {
  String _numberValue = "";
  String get numberValue => _numberValue;

  String? _errorTextNumber;
  String? get errorTextNumber => _errorTextNumber;

  bool _isNumberValid= false;
  bool get isNumberValid => _isNumberValid;

  TextEditingController _numberController = TextEditingController();
  TextEditingController get numberController => _numberController;

  void setField({
    required int index,
    required List<ContactModel> contactList
  }) {
    _numberValue = contactList[index].number;
    _numberController = TextEditingController(text: contactList[index].number);
  }

  void numberOnChanged({
    required String val,
  }){
    if(val.isEmpty){
      _errorTextNumber = "Nomor telepon harus diisi";
      _isNumberValid = false;
    } else if(RegExp(r'[^\d]+$').hasMatch(val)){
      _errorTextNumber = "Nomor telepon harus terdiri dari angka saja";
      _isNumberValid = false;
    } else if( (int.parse(val[0])!=0)){
      _errorTextNumber = "Nomor telepon harus diawali angka 0";
      _isNumberValid = false;
    } else if((val.length < 8 || val.length > 15)){
      _errorTextNumber = "Nomor telepon harus terdiri dari 8-15 digit";
      _isNumberValid = false;
    } else if(RegExp(r'^0[0-9]{6,14}$').hasMatch(val)){
      _errorTextNumber = null;
      _isNumberValid = true;
      _numberValue = val;
    }
  notifyListeners();
  }

  void clearField(){
    _numberController.clear();
    _isNumberValid = true;
    _numberValue = "";
    notifyListeners();
  }
}