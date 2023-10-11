import 'package:file_picker/file_picker.dart';
import 'dart:ui';

import 'package:storage_project/themes/theme_colors.dart';

class ContactModel {
  String name;
  String number;
  PlatformFile? profilePicture;
  DateTime birthDate;
  Color profileBorderColor;

  ContactModel ({
    required this.name,
    required this.number,
    required this.profilePicture,
    required this.birthDate,
    required this.profileBorderColor,
  });

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'number' : number,
      'profilePicture' : profilePicture,
      'birthDate' : birthDate,
      'profileBorderColor' : profileBorderColor
    };
  }

  // ContactModel.fromMap(Map<String,dynamic> map){
  //   name = map['name'];
  //   number = map['number'];
  //   profilePicture = map['profilePicture'];
  //   birthDate = map['birthDate'];
  //   profileBorderColor = map['profileBorderColor'];
  // }
}