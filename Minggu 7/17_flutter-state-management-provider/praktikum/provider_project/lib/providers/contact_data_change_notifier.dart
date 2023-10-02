import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactDataChangeNotifier with ChangeNotifier {
  final List<ContactModel> _contactList = [];
  List<ContactModel> get contactList => _contactList;

  void addContact({
    required String nameValue,
    required String numberValue,
    PlatformFile? profilePictureFile,
    required DateTime pickedDateValue,
    required Color pickedColorValue
  }){
    _contactList.add(
      ContactModel(
        name: nameValue,
        number: numberValue,
        profilePicture: profilePictureFile,
        birthDate: pickedDateValue,
        profileBorderColor: pickedColorValue
      )
    );
    notifyListeners();
  }

  void deleteContact({
    required int index
  }){
    _contactList.removeAt(index);
    notifyListeners();
  }

  void editContact({
    required int index,
    required String nameValue,
    required String numberValue,
    PlatformFile? profilePictureFile,
    required pickedDateValue,
    required Color pickedColorValue
  }){
    _contactList[index].name = nameValue;
    _contactList[index].number = numberValue;
    _contactList[index].birthDate = pickedDateValue;
    _contactList[index].profileBorderColor = pickedColorValue;
    _contactList[index].profilePicture = profilePictureFile;

    notifyListeners();
  }
}