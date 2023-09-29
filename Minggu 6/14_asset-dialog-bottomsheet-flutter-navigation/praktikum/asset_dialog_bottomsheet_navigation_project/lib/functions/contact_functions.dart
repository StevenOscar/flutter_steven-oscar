import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import 'package:file_picker/file_picker.dart';

  Map nameValidator({
    required String val,
  }){
    String? errorTextName;
    bool isNameValid;

    if(val.isEmpty){
      errorTextName = "Nama harus diisi";
      isNameValid = false;
    } else if(!(val.contains(" "))){
      errorTextName = "Nama minimal terdiri dari 2 kata";
      isNameValid = false;
    } else if(RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?/~\\-]').hasMatch(val)){
      errorTextName = "Nama tidak boleh mengandung angka atau karakter khusus";
      isNameValid = false;
    } else if(RegExp(r'\b[a-z][a-z]*\b').hasMatch(val)){
      errorTextName = "Setiap kata harus diawali dengan huruf kapital";
      isNameValid = false;
    } else if(RegExp(r'^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)+$').hasMatch(val)){
      errorTextName = null;
      isNameValid = true;
    } else {
      // kondisi bila user menginput nama dengan 2 kata, tapi menghapus kata kedua dan menyisakan spasinya saja
      errorTextName = "Nama minimal terdiri dari 2 kata";
      isNameValid = false;
    }
    return {"errorTextName" : errorTextName, "isNameValid" : isNameValid};
  }

  Map numberValidator({
    required String val,
  }){
    String? errorTextNumber;
    bool isNumberValid = false;

    if(val.isEmpty){
      errorTextNumber = "Nomor telepon harus diisi";
      isNumberValid = false;
    } else if(RegExp(r'[^\d]+$').hasMatch(val)){
      errorTextNumber = "Nomor telepon harus terdiri dari angka saja";
      isNumberValid = false;
    } else if( (int.parse(val[0])!=0)){
      errorTextNumber = "Nomor telepon harus diawali angka 0";
      isNumberValid = false;
    } else if((val.length < 8 || val.length > 15)){
      errorTextNumber = "Nomor telepon harus terdiri dari 8-15 digit";
      isNumberValid = false;
    } else if(RegExp(r'^0[0-9]{6,14}$').hasMatch(val)){
      errorTextNumber = null;
      isNumberValid = true;
    }
    return {"errorTextNumber" : errorTextNumber, "isNumberValid" : isNumberValid};
  }

  List<ContactModel> addContact({
    required List<ContactModel> contactList,
    required String nameValue,
    required String numberValue,
    PlatformFile? profilePictureFile,
    required DateTime pickedDateValue,
    required Color pickedColorValue
  }){
    contactList.add(
      ContactModel(
        name: nameValue,
        number: numberValue,
        profilePicture: profilePictureFile,
        birthDate: pickedDateValue,
        profileBorderColor: pickedColorValue
      )
    );

    return contactList;
  }

  List<ContactModel> deleteContact({
    required List<ContactModel> contactList,
    required int index
  }){
    contactList.removeAt(index);

    return contactList;
  }

  List<ContactModel> editContact({
    required List<ContactModel> contactList,
    required int index,
    required String nameValue,
    required String numberValue,
    PlatformFile? profilePictureFile,
    required pickedDateValue,
    required Color pickedColorValue
  }){
    contactList[index].name = nameValue;
    contactList[index].number = numberValue;
    contactList[index].birthDate = pickedDateValue;
    contactList[index].profileBorderColor = pickedColorValue;
    contactList[index].profilePicture = profilePictureFile;

    return contactList;
  }
