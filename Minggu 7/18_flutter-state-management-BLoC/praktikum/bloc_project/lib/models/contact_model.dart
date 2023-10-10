import 'package:file_picker/file_picker.dart';
import 'dart:ui';

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
}