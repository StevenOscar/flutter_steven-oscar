import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class FormNameChangeNotifier with ChangeNotifier {
  String _nameValue = "";
  String get nameValue => _nameValue;

  String? _errorTextName;
  String? get errorTextName => _errorTextName;

  bool _isNameValid= false;
  bool get isNameValid => _isNameValid;

  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  void setField({
    required int index,
    required List<ContactModel> contactList
  }) {
    _nameValue = contactList[index].name;
    _nameController = TextEditingController(text: contactList[index].name);
    _isNameValid = true;
  }

  void nameOnChanged({
    required String val,
  }){
    if(val.isEmpty){
      _errorTextName = "Nama harus diisi";
      _isNameValid = false;
    } else if(!(val.contains(" "))){
      _errorTextName = "Nama minimal terdiri dari 2 kata";
      _isNameValid = false;
    } else if(RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?/~\\-]').hasMatch(val)){
      _errorTextName = "Nama tidak boleh mengandung angka atau karakter khusus";
      _isNameValid = false;
    } else if(RegExp(r'\b[a-z][a-z]*\b').hasMatch(val)){
      _errorTextName = "Setiap kata harus diawali dengan huruf kapital";
      _isNameValid = false;
    } else if(RegExp(r'^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)+$').hasMatch(val)){
      _errorTextName = null;
      _isNameValid = true;
      _nameValue = val;
    } else {
      // kondisi bila user menginput nama dengan 2 kata, tapi menghapus kata kedua dan menyisakan spasinya saja
      _errorTextName = "Nama minimal terdiri dari 2 kata";
      _isNameValid = false;
    }
  notifyListeners();
  }

  void clearField(){
    _nameController.clear();
    _nameValue = "";
    _isNameValid = false;
    notifyListeners();
  }
}