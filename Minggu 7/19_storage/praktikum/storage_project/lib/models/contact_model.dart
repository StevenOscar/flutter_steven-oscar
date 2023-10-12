import 'package:file_picker/file_picker.dart';
import 'dart:ui';

class ContactModel {
  late int id;
  late String name;
  late String number;
  late PlatformFile? profilePicture;
  late DateTime birthDate;
  late Color profileBorderColor;

  ContactModel ({
    required this.id,
    required this.name,
    required this.number,
    required this.profilePicture,
    required this.birthDate,
    required this.profileBorderColor,
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'name' : name,
      'number' : number,
      'file_name' : profilePicture?.name,
      'file_path' : profilePicture?.path,
      'file_size' : profilePicture?.size,
      'birth_date' : birthDate.toString(),
      'profile_border_color' : profileBorderColor.value
    };
  }

  factory ContactModel.fromMap(Map<String,dynamic> map){
    return ContactModel(
      id : map['id'],
      name : map['name'],
      number : map['number'],
      profilePicture : map['file_name'] != null ?
        PlatformFile(
          name: 'file_name',
          path: map['file_path'],
          size: map['file_size'],
        ) : null,
      birthDate : DateTime.parse(map['birth_date']),
      profileBorderColor : Color(map['profile_border_color'])
    );
  }
}